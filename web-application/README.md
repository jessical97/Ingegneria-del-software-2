# FORTUNE
Fortune is a web-app, to create invoices. We tried to make the graphics as intuitive as possible in order to simplify and optimize the training time of future users. Major feature are management of [clients](#client), [activities](#activity) and [bills](#bill). These features are accessible directly from the home page


[![Home screenshot](./doc/img/screencapture-2.png)](./doc/img/screencapture-2.png)

## Client
You can show you're list of customers. You can also update, add or delate a client with a minimal operation. In addition, the system denies you the cancellation of customer if you have created some invoices or activities on it.

[![New client screenshot](./doc/img/screencapture-4.png)](./doc/img/screencapture-4.png)

The system can maintain trace of the difference between a business client and a private client. For example, you don’t require to insert the surname in a private costumer and so you're sure that the identification code insert is correct.

## Activity
You can insert the activity made by a client, simply selecting the client and the hour worked.

[![Activities new screenshot](./doc/img/screencapture-6.png)](./doc/img/screencapture-6.png)

The application permit to remove only the activities not billed, so you can be sure that you don't lost your activities for error :smiley:

[![Activities list screenshot](./doc/img/screencapture-8.png)](./doc/img/screencapture-8.png)

## Bill
The system permit to create new bill only by select the client. Other data are automatic filled by the system.

[![Bill new screenshot](./doc/img/screencapture-5.png)](./doc/img/screencapture-5.png)

After the bill creation you can show the invoice PDF and print or download it by clicking “Show PDF”.
The Invoice contain the data about the customer, the hours worked and the relative amount, based on the price for hour that you have set. Our sample template becames from [Sparksuite Simple HTML Invoice Template](https://github.com/sparksuite/simple-html-invoice-template). It's edited to accept the bill's parameters, you can find a copy into [./features/file_upload/invoice-format.html](./features/file_upload/invoice-format.html).

[![Bill list screenshot](./doc/img/invoice.jpg)](./doc/img/invoice.jpg)

## Other application function

From the home you can upload a custom template or change the price for hour used on the bill by the settings page.

[![Settings screenshot](./doc/img/screencapture-9.png)](./doc/img/screencapture-9.png)

## Install
Would you try our product? Follow step on [doc/INSTALL.md](./doc/INSTALL.md) file.