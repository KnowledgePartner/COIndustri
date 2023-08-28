tableextension 51000 GLAccountKP extends "G/L Account"
{
    fields
    {
        field(50100; "Balance at Date (ex ultimo)"; Decimal)
        {
            Caption = 'Balance at Date (ex ultimo)';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum("G/L Entry".Amount where("G/L Account No." = field("No."),
                                                        "G/L Account No." = field(filter(Totaling)),
                                                        "Business Unit Code" = field("Business Unit Filter"),
                                                        "Global Dimension 1 Code" = field("Global Dimension 1 Filter"),
                                                        "Global Dimension 2 Code" = field("Global Dimension 2 Filter"),
                                                        "Posting Date" = field(upperlimit("Date Filter")),
                                                        "VAT Reporting Date" = field(upperlimit("VAT Reporting Date Filter")),
                                                        "Dimension Set ID" = field("Dimension Set ID Filter"),
                                                        Ultimo = const(false)));
        }
        field(50101; "Net Change (ex ultimo)"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = sum("G/L Entry".Amount where("G/L Account No." = field("No."),
                                                        "G/L Account No." = field(filter(Totaling)),
                                                        "Business Unit Code" = field("Business Unit Filter"),
                                                        "Global Dimension 1 Code" = field("Global Dimension 1 Filter"),
                                                        "Global Dimension 2 Code" = field("Global Dimension 2 Filter"),
                                                        "Posting Date" = field("Date Filter"),
                                                        "VAT Reporting Date" = field("VAT Reporting Date Filter"),
                                                        "Dimension Set ID" = field("Dimension Set ID Filter"),
                                                        Ultimo = const(false)));
            Caption = 'Net Change (ex ultimo)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50102; "Budgeted Amount (ex ultimo)"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = sum("G/L Budget Entry".Amount where("G/L Account No." = field("No."),
                                                               "G/L Account No." = field(filter(Totaling)),
                                                               "Business Unit Code" = field("Business Unit Filter"),
                                                               "Global Dimension 1 Code" = field("Global Dimension 1 Filter"),
                                                               "Global Dimension 2 Code" = field("Global Dimension 2 Filter"),
                                                               Date = field("Date Filter"),
                                                               "Budget Name" = field("Budget Filter"),
                                                               "Dimension Set ID" = field("Dimension Set ID Filter"),
                                                               Ultimo = const(false)));

            Caption = 'Budgeted Amount (ex ultimo)';
            FieldClass = FlowField;
        }
        field(50103; "Budget at Date (ex ultimo)"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = sum("G/L Budget Entry".Amount where("G/L Account No." = field("No."),
                                                               "G/L Account No." = field(filter(Totaling)),
                                                               "Business Unit Code" = field("Business Unit Filter"),
                                                               "Global Dimension 1 Code" = field("Global Dimension 1 Filter"),
                                                               "Global Dimension 2 Code" = field("Global Dimension 2 Filter"),
                                                               Date = field(upperlimit("Date Filter")),
                                                               "Budget Name" = field("Budget Filter"),
                                                               "Dimension Set ID" = field("Dimension Set ID Filter")));
            Caption = 'Budget at Date (ex ultimo)';
            Editable = false;
            FieldClass = FlowField;
        }
    }
}