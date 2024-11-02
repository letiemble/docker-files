#!/usr/bin/env bash

# Check if the number of arguments is correct
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <application_package> <mobsf_url> <mobsf_apikey>"
    echo "  <application_package> : The path to the application package to be scanned"
    echo "  <mobsf_url>           : The URL of the MobSF instance"
    echo "  <mobsf_apikey>        : The API key of the MobSF instance"
    exit 1
fi

# Get the parameters from the command line
application_package=$1
mobsf_url=$2
mobsf_apikey=$3

echo
echo "Input file    : $application_package"
echo "MobSF URL     : $mobsf_url"
echo

echo "Waiting for MobSF to be ready..."
max_retries=10
retry_count=0
while [ $retry_count -lt $max_retries ]; do
    curl -m 10 "$mobsf_url" --silent --head --fail --output /dev/null

    if [ $? -eq 0 ]; then
        echo "MobSF is ready"
        break
    else
        echo "Request failed with exit code $?. Retrying in 5 seconds..."
        retry_count=$((retry_count + 1))
        sleep 5
    fi
done
if [ $retry_count -eq $max_retries ]; then
    echo "MobSF is not ready. Exiting..."
    exit 1
fi

echo
echo "> Uploading target file to MobSF..."
output_file="./upload.json"
curl "$mobsf_url/api/v1/upload" --silent -H "X-Mobsf-Api-Key: $mobsf_apikey" -F "file=@$application_package" -o "$output_file"
echo "Parsing JSON response..."
scan_type=$(jq -r ".scan_type" "$output_file")
file_name=$(jq -r ".file_name" "$output_file")
hash=$(jq -r ".hash" "$output_file")
echo "Scan type: $scan_type"
echo "File name: $file_name"
echo "Hash: $hash"

echo
echo "> Performing the scan..."
output_file="./scan.json"
curl "$mobsf_url/api/v1/scan" --silent -H "X-Mobsf-Api-Key: $mobsf_apikey" -F "scan_type=$scan_type" -F "file_name=$file_name" -F "hash=$hash" -o "$output_file"
echo "Scan saved to $output_file"

echo
echo "> Retrieving the scoreboard..."
output_file="./scoreboard.json"
curl "$mobsf_url/api/v1/scorecard" --silent -H "X-Mobsf-Api-Key: $mobsf_apikey" -F "hash=$hash" -o "$output_file"
echo "Scoreboard saved to $output_file"

echo
echo "> Retrieving the report..."
output_file="./report.pdf"
curl "$mobsf_url/api/v1/download_pdf" --silent -H "X-Mobsf-Api-Key: $mobsf_apikey" -F "hash=$hash" -o "$output_file"
echo "Report saved to $output_file"

echo
echo "> Done"
