CREATE TABLE [dbo].[ProductsTable] (
    [ProductNumber] INT            IDENTITY (1, 1) NOT NULL,
    [ProductName]   NVARCHAR (50)  NULL,
    [Description]   NVARCHAR (MAX) NULL,
    [Price]         SMALLMONEY     NULL,
    [Ingredients]   NVARCHAR (MAX) NULL,
    [Image]         VARCHAR (MAX)  NULL,
    PRIMARY KEY CLUSTERED ([ProductNumber] ASC)
);

