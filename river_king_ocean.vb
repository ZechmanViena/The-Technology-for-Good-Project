Public Class SocialTechnologyProject
    'This class holds methods and properties related to our project
    
    'Declare local variables
    Private projectName As String
    Private projectGoal As String
    Private projectCompletion As Date
    Private projectImpact As Integer
    
    'Declare the constructor
    Public Sub New(ByVal name As String, ByVal goal As String, ByVal completion As Date, ByVal impact As Integer)
        projectName = name
        projectGoal = goal
        projectCompletion = completion
        projectImpact = impact
    End Sub
    
    'Declare properties
    Public ReadOnly Property Name() As String
        Get
            Return projectName
        End Get
    End Property
    
    Public ReadOnly Property Goal() As String
        Get
            Return projectGoal
        End Get
    End Property
    
    Public ReadOnly Property Completion() As Date
        Get
            Return projectCompletion
        End Get
    End Property
    
    Public ReadOnly Property Impact() As Integer
        Get
            Return projectImpact
        End Get
    End Property
    
    'Declare methods
    Public Sub SetProjectName(ByVal name As String)
        projectName = name
    End Sub
    
    Public Sub SetProjectGoal(ByVal goal As String)
        projectGoal = goal
    End Sub
    
    Public Sub SetProjectCompletion(ByVal completion As Date)
        projectCompletion = completion
    End Sub
    
    Public Sub SetProjectImpact(ByVal impact As Integer)
        projectImpact = impact
    End Sub
    
    Public Function ProjectDetails() As String
        Return "Project Name: " & projectName & "Project Goal: " & projectGoal & "Project Completion Date: " & projectCompletion & "Project Impact: " & projectImpact
    End Function
    
End Class