## Workflow ##
The scenario I envisage is a small business or sole trader already working with Mathematica and desiring to integrate their invoicing, accounting and financial planning requirements with financial or other data already processed with Mathematica. The eventual aim is to have a fully-fledged and reliable double-entry accounting system which produces taxation, balance sheet and profit and loss statements suitable for statutory reporting (e.g. annual accounts to Companies House in the UK, sales tax reports in the US (I guess you need these?) or quarterly VAT returns in the European Union). Another aim is to create a cash-flow forecasting mode which would allow financial plans to be kept integrated with the actual state of accounts as they evolve. It might at some stage be possible to produce a version that works inside CDF Player Pro which would create a cheaper alternative to the full Mathematica version for organisations who do not (yet) use Mathematica.

Please bear in mind that I am not an accountant and have had minimal formal accounting or bookkeeping training and I am very open to comments or corrections that would improve on these preliminary ideas.

### Current workflow ###
I tend to use my bank statements as the starting point for preparing accounts so my current workflow is as follows:

 1. [Hand] Download .html from my banking website (smile: they do not provide accounts in standard accounting formats such as .qif)
 2. [Mma] Extract the transactions (the code evolves over time as the format of pages changes) as a table
 3. [Mma] Create and save any required changes to structure of accounts (renaming, creating or moving accounts)
 4. [Mma] Create any required mappings from the description field to specific accounts (this can save a lot of time in later steps; it is straightforward to use string patterns or regular expressions to define such mappings)
 5. [Mma] Export transactions into a .qif format file, assigning accounts using information provided in previous step
 6. [Hand] Import the generated file into an accounting package for the remaining bookkeeping and accounting work (Gnucash in my case)

The last 2 steps would be less important for me if I could use Mathematica all the way but the ability to export accounts into different formats is very useful.

### Desired new workflow ###
Basically, replace Gnucash by Mathematica for the following tasks:

 1. Sales Invoice creation.  This creates an entry in Accounts Receivable which will later (we hope!) be offset by income transaction(s).
 2. Purchase order creation.  Dually, this creates an entry in Accounts Payable.
 3. Quarterly VAT report generation.  Currently I get a report which needs further processing using a spreadsheet. This could be much better automated.
 4. Manual entry and editing of transactions, particularly for transaction splits (this is where, for example, a direct purchase from a bank account is split out into a VAT portion and a portion allocated to an expense account).
 5. Searching for transactions using date, description or value fields.  Gnucash has quite limited search facilities and even when I have a suitable list of transactions I cannot perform any bulk actions such as deletion or moving.  This is a desirable additional feature for this project.
 6. Trial balance, profit and loss and balance sheet preparation for specific accounting periods.
 7. Verifying transactions and checking them off at the end of an accounting period.
 8. Transferring balances at year end to clear accounts for the next accounting period.  This provides a running account of the business finances that is very useful for checking against published accounts.
 9. Budgeting. I don't use this feature much as a proper cash-flow forecast is much more useful to me (Gnucash doesn't provide this).

Many of these steps imply other actions such as creating a new customer or supplier, creating a job number for invoicing, recording accounting dates and tax rates, posting an invoice to the accounts, setting up an initial chart of accounts, auto-completion in transaction fields, numbering transactions and so on. There is quite a lot involved in making the bookkeeping part of the job efficient, especially in creating and editing transaction splits.  Gnucash is good here, but many action sequences could be automated.
