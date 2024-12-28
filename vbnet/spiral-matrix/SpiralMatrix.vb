Imports System

Public Class SpiralMatrix
    Public Shared Function GetMatrix(ByVal size As Integer) As Integer(,)
        Dim matrix(size - 1, size - 1) As Integer
        For i As Integer = 0 To size - 1
          For j As Integer = 0 To size - 1
            matrix(i, j) = Calculate(j + 1, i + 1, size * 2)
          Next
        Next
        Return matrix
    End Function

    Private Shared Function Calculate(ByVal x As Integer, ByVal y As Integer, ByVal s As Integer) As Integer
      If y = 1 Then
        Return x
      End If
      Return s \ 2 + Calculate(y - 1, s \ 2 - x + 1, s - 1)
    End Function
End Class
