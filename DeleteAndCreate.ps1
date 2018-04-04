$localRepo="C:\Users\Hattie\Documents\Work\NewRepo"
$Githubrepo="git@github.com:hclough/NewRepo.git"
$repoName="NewRepo"
Set-Location $localRepo

#$curlArgument = '-u', 'hclough:b70f85e2b541dcd953a7d983a9601be3f200ad1d', 'https://api.github.com/hclough'
#try{& "C:\Program Files\Git\mingw64\bin" -u hclough:b70f85e2b541dcd953a7d983a9601be3f200ad1d https://api.github.com/hclough}catch{}

try{& "C:\Program Files\Git\bin\git.exe" clone $Githubrepo}catch{}
Set-Location .\$($repoName)
try{& "C:\Program Files\Git\bin\git.exe" rm * }catch{}
try{& "C:\Program Files\Git\bin\git.exe" commit -m "delete"}catch{}
try{& "C:\Program Files\Git\bin\git.exe" push -u origin master}catch{}
Set-Location $localRepo
Remove-Item -force -recurse -Path $localRepo"/"$repoName 


##add is now broken. unsure why
try{& "C:\Program Files\Git\bin\git.exe" init}catch{}
try{& "C:\Program Files\Git\bin\git.exe" add *}catch{}
try{& "C:\Program Files\Git\bin\git.exe" commit -m "commit test file"}catch{}
try{& "C:\Program Files\Git\bin\git.exe" remote add origin $Githubrepo}catch{}
try{& "C:\Program Files\Git\bin\git.exe" push -u origin master}catch{}
