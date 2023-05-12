$destFile = "C:\Final save location\Filename.txt"

$tempFile = ".\openphish.txt"
$outputFile = ".\phishList.txt"

rm $tempFile
rm $outputFile

curl "https://openphish.com/feed.txt" -o $tempFile

$reader = new-object System.IO.StreamReader($tempFile)

while(($line = $reader.ReadLine()) -ne $null)
{
  [uri]$URL = $line
  Add-Content $outputFile $URL.Host
}
$reader.Close()
$reader.Dispose()
cp $outputFile $destFile