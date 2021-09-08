namespace devcommon;
 
using { cuid, managed, Currency } from '@sap/cds/common';
using { masterdata } from './master-data';
 
extend sap.common.Currencies with {
    numcode  : Integer;
    exponent : Integer; //> e.g. 2 --> 1 Dollar = 10^2 Cent
    minor    : String; //> e.g. 'Cent'
}
 
type CurrencyType : Decimal(15, 2)@(
        Semantics.amount.currencyCode : 'CURRENCY_code',
        sap.unit                      : 'CURRENCY_code'
    );
 
aspect Accounting {
        currency: Currency;
        price : CurrencyType;
        taxrate   : CurrencyType;
        grossAmount : CurrencyType;
        netAmount : CurrencyType;
        taxAmount : CurrencyType;
        totalGrossAmount: CurrencyType;
        totalNetAmount: CurrencyType;
        totalTaxAmount: CurrencyType;
    }
 
annotate Accounting with {
        currency @(title : '{i18n>currency}');
        price @(title : '{i18n>price}');
        taxrate   @(title : '{i18n>taxRate}');
        grossAmount @(title : '{i18n>grossAmount}');
        netAmount @(title : '{i18n>netAmount}');
        taxAmount @(title : '{i18n>taxAmount}');
        totalGrossAmount @(title : '{i18n>totalGrossAmount}');
        totalNetAmount @(title : '{i18n>totalNetAmount}');
        totalTaxAmount @(title : '{i18n>totalTaxAmount}');
    }