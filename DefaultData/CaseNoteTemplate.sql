
DECLARE @Templates TABLE(
[TemplateName] varchar(50) NOT NULL
	, [Template] nvarchar(max) NOT NULL
	, [IsActive] bit NOT NULL)

TRUNCATE TABLE [case].[NoteTemplate];

INSERT @Templates(
	TemplateName,
		Template,
		IsActive)
VALUES(
		'Help with this page',
		N'<h1>Title</h1>
	<br />
	<h3> You will use this page to explain the different options, functions, features and buttons in Flexmls, Helios, Atlas, etc.
	</h3>
	<br />
	<p>State what this feature is</p>
	<ul>
	<li> List what it does </li>
	<li> 1 </li>
	<li> 2 </li>
	<li> 3 </li>
	<li> 4 </li>
	</ul>',
	0x01),
	(
		'FAQ',
		N'<h1>Title</h1> <br /> <ol><li>Question</li><a>a. Answer </a><li>Question</li><a>a. Answer </a><li>Question</li><a>a. Answer </a></ol> <br /> <footer> *ImportantNotes, Clarification </footer>',
		0x01),
	(
		'Flex Changes',
		N'<h1>00-00-0 Flexmls Web: Title of the Change.</h1>
<br />
<p style="font-size:80%;">Today, Subscribers will be able to (explain the change)</p>
<br />
<strong style="color:red;">Why are we making this change?</strong>
<br />
<p>Example, example &amp; example.</p>
<br />
<strong style="color:red;">When will it change?</strong>
<br />
<p>Example, example &amp; example.</p>
<br />
<strong style="color:red;">Who will be affected?</strong>
<br />
<p>Example, example &amp; example.</p>
<br />
<strong style="color:red;">What will change?</strong>
<br />',
		0x01
	),
	(
		'Procedures',
		N'<h1>Title</h1>
<br />
<p>Purpose and Scope (if needed)<p>
<p>Explain what the purpose and scope is,... </p>
<br />
<br />
<h3>Procedure</h3>
<br />
<ol>
<li>Example</li>
<li>Example</li>
<li>Example</li>
<li>Example</li>
<li>Example</li>
<li>Example</li>
<li>Example</li>
<li>Example</li>
</ol>

<footer>*any important notes and clarifications go here. </footer>',
		0x01
	);

MERGE [case].[NoteTemplate] AS TARGET
USING @Templates as SOURCE ON
	(TARGET.TemplateName = SOURCE.TemplateName)
WHEN MATCHED THEN UPDATE
	SET
		Template = SOURCE.Template
		, IsActive = SOURCE.IsActive
WHEN NOT MATCHED THEN
	INSERT(
		TemplateName,
		Template,
		IsActive)
	VALUES(
		SOURCE.TemplateName
		,SOURCE.Template
		,SOURCE.IsActive);
