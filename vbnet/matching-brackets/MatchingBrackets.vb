Imports System.Collections.Generic
Imports System.Text.RegularExpressions

Public Module MatchingBrackets
    Public Function IsPaired(ByVal input As String) As Boolean
        Dim brackets As String = Regex.Replace(input, "[^\(\)\[\]{}]", "")

        While brackets <> ""
          Dim pattern As String = "(\(\)|\[\]|{})"
          Dim updated As String = Regex.Replace(brackets, pattern, "")
          If updated = brackets Then
            Return False
          End If
          brackets = updated
        End While
        Return True
    End Function
End Module