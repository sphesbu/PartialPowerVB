Imports System
Imports System.Data
Imports System.IO

Public Class index
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            LoadInitialData()
        End If
    End Sub

    Private Sub LoadInitialData()
        Dim filePath As String = Server.MapPath("~/Data.txt")
        Dim dt As New DataTable()

        Try
            Using reader As New StreamReader(filePath)
                Dim headers As String() = reader.ReadLine().Split(","c)
                For Each header As String In headers
                    dt.Columns.Add(header.Trim())
                Next

                While Not reader.EndOfStream
                    Dim row As String() = reader.ReadLine().Split(","c)
                    dt.Rows.Add(row)
                End While
            End Using

            ' Bind the DataTable to the Repeater
            Repeater1.DataSource = dt
            Repeater1.DataBind()
        Catch ex As Exception
            ' Handle the exception as needed
            Console.WriteLine("Error loading initial data: " & ex.Message)
        End Try
    End Sub

    Protected Sub Repeater1_ItemCommand(ByVal source As Object, ByVal e As RepeaterCommandEventArgs) Handles Repeater1.ItemCommand
        If e.CommandName = "ViewDetails" Then
            ' Retrieve the name from CommandArgument
            Dim name As String = e.CommandArgument.ToString()
            DisplayRowDetails(name)
        End If
    End Sub

    Private Sub DisplayRowDetails(ByVal name As String)
        Dim filePath As String = Server.MapPath("~/Data.txt")
        Dim dt As New DataTable()

        Try
            Using reader As New StreamReader(filePath)
                Dim headers As String() = reader.ReadLine().Split(","c)
                For Each header As String In headers
                    dt.Columns.Add(header.Trim())
                Next

                While Not reader.EndOfStream
                    Dim row As String() = reader.ReadLine().Split(","c)
                    ' Use the Name column to identify the row
                    If row(0).Trim() = name Then
                        dt.Rows.Add(row)
                    End If
                End While
            End Using

            If dt.Rows.Count > 0 Then
                Dim row As DataRow = dt.Rows(0)
                txtName.Text = row("Name").ToString()
                txtAge.Text = row("Age").ToString()
                txtGender.Text = row("Gender").ToString()
                txtCity.Text = row("City").ToString()
                txtCountry.Text = row("Country").ToString()
                txtOccupation.Text = row("Occupation").ToString()
                txtSalary.Text = row("Salary").ToString()
                txtDepartment.Text = row("Department").ToString()
                txtExperience.Text = row("Experience").ToString()
                txtStatus.Text = row("Status").ToString()

                ' Store the name in ViewState for use in the Save method
                ViewState("CurrentName") = name

                PanelEdit.Visible = True
            End If
        Catch ex As Exception
            ' Handle the exception as needed
            Console.WriteLine("Error displaying row details: " & ex.Message)
        End Try
    End Sub

    Protected Sub btnSave_Click(ByVal sender As Object, ByVal e As EventArgs)
        ' Retrieve the name from ViewState
        Dim name As String = ViewState("CurrentName").ToString()

        ' Retrieve values from textboxes
        Dim age As String = txtAge.Text
        Dim gender As String = txtGender.Text
        Dim city As String = txtCity.Text
        Dim country As String = txtCountry.Text
        Dim occupation As String = txtOccupation.Text
        Dim salary As String = txtSalary.Text
        Dim department As String = txtDepartment.Text
        Dim experience As String = txtExperience.Text
        Dim status As String = txtStatus.Text

        ' Update the data source
        UpdateRowInDataSource(name, age, gender, city, country, occupation, salary, department, experience, status)

        ' Hide the edit panel and refresh the repeater
        PanelEdit.Visible = False
        LoadInitialData()
    End Sub

    Private Sub UpdateRowInDataSource(ByVal name As String, ByVal age As String, ByVal gender As String, ByVal city As String, ByVal country As String, ByVal occupation As String, ByVal salary As String, ByVal department As String, ByVal experience As String, ByVal status As String)
        Dim filePath As String = Server.MapPath("~/Data.txt")
        Dim lines As New List(Of String)()
        Dim headers As String = "Name,Age,Gender,City,Country,Occupation,Salary,Department,Experience,Status"

        ' Read all lines from the file
        Using reader As New StreamReader(filePath)
            lines.Add(reader.ReadLine()) ' Add headers
            While Not reader.EndOfStream
                Dim line As String = reader.ReadLine()
                Dim columns As String() = line.Split(","c)
                If columns(0).Trim() = name Then
                    ' Update the row with new values
                    line = String.Join(",", {name, age, gender, city, country, occupation, salary, department, experience, status})
                End If
                lines.Add(line)
            End While
        End Using

        ' Write updated lines back to the file
        Using writer As New StreamWriter(filePath)
            writer.WriteLine(headers)
            For Each line In lines
                writer.WriteLine(line)
            Next
        End Using
    End Sub
End Class
