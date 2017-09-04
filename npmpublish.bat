@ECHO OFF

IF NOT EXIST "package.json" (
	IF "%pathString%"=="" (
		SET /p pathString= "Please Enter NPM Module Path:"
		npmpublish
		)
	SET newPath=%pathString%
	SET pathString=
	cd  /D "%newPath%"
)

SET /p commitMessage= "Please Enter Commit Message:"
git add . && git commit -m "%commitMessage%" && git push -u origin master && npm publish
SET commitMessage=