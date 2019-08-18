Dim fso
Set fso = CreateObject("Scripting.FileSystemObject")

Dim pluginPath
pluginPath = fso.getParentFolderName(WScript.ScriptFullName)
Dim srcPath
srcPath = pluginPath&"/src"
Dim functionPath
functionPath = srcPath&"/function"
Dim outputPath
outputPath = pluginPath&"/script"

For Each srcFilePath In fso.GetFolder(srcPath).files
    Dim outputFilePath
    outputFilePath = outputPath&"/"&srcFilePath.name
    Dim outputFile
    Set outputFile = fso.OpenTextFile(outputFilePath, 2, True)

    call createPartition(outputFile, "ParamPath")
    outputFile.WriteLine("var paramPath = '"&pluginPath&"\param';")
    outputFile.WriteLine("")

    call createPartition(outputFile, "ParamPath")
    outputFile.WriteLine("var viewFilePath = '"&pluginPath&"\2048View';")
    outputFile.WriteLine("")

    For Each functionFilePath In fso.GetFolder(functionPath).files
        call createPartition(outputFile, functionFilePath.name)
        Dim functionFile
        Set functionFile = fso.OpenTextFile(functionFilePath, 1)
        outputFile.WriteLine(functionFile.ReadAll())
        outputFile.WriteLine("")
    Next

    call createPartition(outputFile, "MainModule")
    Dim srcFile
    Set srcFile = fso.OpenTextFile(srcFilePath, 1)
    outputFile.Write(srcFile.ReadAll())

Next

Sub createPartition(outputFile, name)
    Dim barLen
    Dim leftBarLen
    Dim rightBarLen
    barLen = 50
    leftBarLen = Round((barLen-Len(name)) / 2 - 0.5)
    rightBarLen = Round((barLen-Len(name)) / 2 + 0.5)
    Dim leftBar
    Dim rightBar
    leftBar = String(leftBarLen, "-")
    rightBar = String(rightBarLen, "-")
    outputFile.WriteLine(leftBar&name&rightBar)
End Sub

msgbox "compiled"