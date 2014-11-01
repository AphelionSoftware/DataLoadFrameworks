USE [Paga_EDW]
GO

/****** Object:  View [OLAP].[DimApprovedByUser]    Script Date: 2014-11-01 07:37:34 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


  

CREATE VIEW [OLAP].[DimApprovedByUser]
AS

SELECT 
	[DimApprovedByUser_6169299845028427303].[CreatedDateID] AS [UserCreatedDateID]
	,[DimApprovedByUser_6169299845028427303].[DateOfBirthID] AS [UserDateOfBirthID]
	,[DimApprovedByUser_6169299845028427303].[DimOrganizationUnitLevel4ID] AS [UserDimOrganizationUnitLevel4ID]
	,[DimApprovedByUser_6169299845028427303].[DimPagaAccountID] AS [UserDimPagaAccountID]
	,[DimApprovedByUser_6169299845028427303].[DimUserID] AS [UserDimApprovedByUserID]
	,[DimApprovedByUser_6169299845028427303].[Email] AS [UserEmail]
	,[DimApprovedByUser_6169299845028427303].[FirstName] AS [UserFirstName]
	,[DimApprovedByUser_6169299845028427303].[IsEnabled] AS [UserIsEnabled]
	,[DimApprovedByUser_6169299845028427303].[LastName] AS [UserLastName]
	,[DimApprovedByUser_6169299845028427303].[MiddleName] AS [UserMiddleName]
	,[DimApprovedByUser_6169299845028427303].[Name] AS [UserName]
	,[DimApprovedByUser_6169299845028427303].[PhoneNumber] AS [UserPhoneNumber]
	,[DimApprovedByUser_6169299845028427303].[Sex] AS [UserSex]
	,[DimApprovedByUser_6169299845028427303].[SourceKey] AS [UserSourceKey]
	,[DimPagaAccount_8584644694627272522].[BankingStatus] AS [PagaAccountBankingStatus]
	,[DimPagaAccount_8584644694627272522].[CreatedDateID] AS [PagaAccountCreatedDateID]
	,[DimPagaAccount_8584644694627272522].[DimPagaAccountID] AS [PagaAccountDimPagaAccountID]
	,[DimPagaAccount_8584644694627272522].[DimPagaAccountStatusID] AS [PagaAccountDimPagaAccountStatusID]
	,[DimPagaAccount_8584644694627272522].[ExternalAccountNumber] AS [PagaAccountExternalAccountNumber]
	,[DimPagaAccount_8584644694627272522].[hasOnlineAccount] AS [PagaAccounthasOnlineAccount]
	,[DimPagaAccount_8584644694627272522].[IsActive] AS [PagaAccountIsActive]
	,[DimPagaAccount_8584644694627272522].[IsAffiliate] AS [PagaAccountIsAffiliate]
	,[DimPagaAccount_8584644694627272522].[IsAgent] AS [PagaAccountIsAgent]
	,[DimPagaAccount_8584644694627272522].[IsBank] AS [PagaAccountIsBank]
	,[DimPagaAccount_8584644694627272522].[IsBusiness] AS [PagaAccountIsBusiness]
	,[DimPagaAccount_8584644694627272522].[IsCardProcessor] AS [PagaAccountIsCardProcessor]
	,[DimPagaAccount_8584644694627272522].[IsCashCollector] AS [PagaAccountIsCashCollector]
	,[DimPagaAccount_8584644694627272522].[IsCustomer] AS [PagaAccountIsCustomer]
	,[DimPagaAccount_8584644694627272522].[IsEnabled] AS [PagaAccountIsEnabled]
	,[DimPagaAccount_8584644694627272522].[IsMerchant] AS [PagaAccountIsMerchant]
	,[DimPagaAccount_8584644694627272522].[IsMobileOperator] AS [PagaAccountIsMobileOperator]
	,[DimPagaAccount_8584644694627272522].[IsPaga] AS [PagaAccountIsPaga]
	,[DimPagaAccount_8584644694627272522].[IsRemittanceProcessor] AS [PagaAccountIsRemittanceProcessor]
	,[DimPagaAccount_8584644694627272522].[IsServiceAggregator] AS [PagaAccountIsServiceAggregator]
	,[DimPagaAccount_8584644694627272522].[Name] AS [PagaAccountName]
	,[DimPagaAccount_8584644694627272522].[PagaAccountNumber] AS [PagaAccountPagaAccountNumber]
	,[DimPagaAccount_8584644694627272522].[RegistrationDateID] AS [PagaAccountRegistrationDateID]
	,[DimPagaAccount_8584644694627272522].[SourceKey] AS [PagaAccountSourceKey]
	,[DimPagaAccountStatus_5186060155232598495].[DimPagaAccountStatusID] AS [PagaAccountStatusDimPagaAccountStatusID]
	,[DimPagaAccountStatus_5186060155232598495].[Name] AS [PagaAccountStatusName]
	,[DimPagaAccountStatus_5186060155232598495].[SourceKey] AS [PagaAccountStatusSourceKey]
FROM [Shared].[DimUser] AS [DimApprovedByUser_6169299845028427303]

    LEFT JOIN [Shared].[DimPagaAccount] AS [DimPagaAccount_8584644694627272522] 
    
    JOIN [Classification].[DimPagaAccountStatus] AS [DimPagaAccountStatus_5186060155232598495] 
    
        ON  [DimPagaAccount_8584644694627272522].[DimPagaAccountStatusID] = [DimPagaAccountStatus_5186060155232598495].[DimPagaAccountStatusID]

    ON  [DimApprovedByUser_6169299845028427303].[DimPagaAccountID] = [DimPagaAccount_8584644694627272522].[DimPagaAccountID]

GO


