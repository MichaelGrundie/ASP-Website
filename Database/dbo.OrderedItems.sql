CREATE TABLE [dbo].[OrderedItems] (
    [Id]            INT IDENTITY (1, 1) NOT NULL,
    [ProductNumber] INT NULL,
    [OrderNumber]   INT NULL,
    [Quantity]      INT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_OrderedItems_OrdersTable] FOREIGN KEY ([OrderNumber]) REFERENCES [dbo].[OrdersTable] ([OrderNumber]),
    CONSTRAINT [FK_OrderedItems_ProductsTable] FOREIGN KEY ([ProductNumber]) REFERENCES [dbo].[ProductsTable] ([ProductNumber])
);

