${SegmentFile}
Var CustomFirstRunDone

${SegmentPre}
	ReadINIStr $0 "$EXEDIR\Data\settings\FerdiPortableFirstRun.ini" "FirstRun" "Done"
	${If} $0 != true
		ClearErrors
		MessageBox MB_ICONINFORMATION|MB_OK "IMPORTANT PORTABILITY NOTE!$\r$\n$\r$\nYou need to create/sign in your account and go to settings and uncheck the option 'Launch Ferdi on start' because this option do not use the FerdiPortable.exe but the Ferdi.exe."		
		StrCpy $CustomFirstRunDone true
	${EndIf}
!macroend
${SegmentPost}
	${If} $CustomFirstRunDone == true
		WriteINIStr "$EXEDIR\Data\settings\FerdiPortableFirstRun.ini" "FirstRun" "Done" "true"
	${EndIf}
!macroend
