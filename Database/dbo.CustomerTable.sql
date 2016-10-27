CREATE TABLE [dbo].[CustomerTable] (
    [CustomerNumber] INT           IDENTITY (1, 1) NOT NULL,
    [Title]          NVARCHAR (50) NULL,
    [Forename]       NVARCHAR (50) NULL,
    [Surname]        NVARCHAR (50) NULL,
    [Address]        NVARCHAR (50) NULL,
    [Postcode]       NVARCHAR (50) NULL,
    [PhoneNumber]    NVARCHAR (15) NULL,
    [EmailAddress]   NVARCHAR (50) NULL,
    [Password]       NVARCHAR (15) NULL,
    [IsAdmin]        BIT           NULL,
    PRIMARY KEY CLUSTERED ([CustomerNumber] ASC)
);

