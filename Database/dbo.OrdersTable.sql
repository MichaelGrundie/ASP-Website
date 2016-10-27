CREATE TABLE [dbo].[OrdersTable] (
    [OrderNumber]         INT IDENTITY (1, 1) NOT NULL,
    [CustomerNumber]      INT NOT NULL,
    [OrderCompleteStatus] BIT DEFAULT ((0)) NOT NULL,
    PRIMARY KEY CLUSTERED ([OrderNumber] ASC),
    CONSTRAINT [FK_OrdersTable_CustomerTable] FOREIGN KEY ([CustomerNumber]) REFERENCES [dbo].[CustomerTable] ([CustomerNumber])
);

