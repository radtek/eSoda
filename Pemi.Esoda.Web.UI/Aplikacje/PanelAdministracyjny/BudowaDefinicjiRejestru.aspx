﻿<%@ Page Language="C#" MasterPageFile="~/MasterPages/SingleColumn.Master" AutoEventWireup="true" CodeBehind="BudowaDefinicjiRejestru.aspx.cs" Inherits="Pemi.Esoda.Web.UI.Aplikacje.PanelAdministracyjny.BudowaDefinicjiRejestru" Title="Struktura rejestru" %>
<%@ Register Src="~/Controls/OperacjePaneluAdministracyjnego.ascx" TagName="OperacjePanelu" TagPrefix="uc1" %>
<%@ Register Src="~/Controls/OperacjeRejestrow.ascx" TagName="OperacjeRejestrow" TagPrefix="uc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
<uc1:OperacjePanelu ID="OperacjePanelu1" runat="server" />
<uc1:OperacjeRejestrow ID="OperacjeRejestrow1" runat="server" />
<div id="leftColumn">
<fieldset>
<legend>Budowa struktury rejestru</legend>
<table>
<tr><th colspan="2">Struktura rejestru</th><th>Szczegóły nowego elementu</th></tr>
<tr><td colspan="2">
    <asp:TreeView ID="tvStrukturaRejestru" runat="server" 
        AutoGenerateDataBindings="False" DataSourceID="xmldsStrukturaRejestru" 
        onselectednodechanged="tvStrukturaRejestru_SelectedNodeChanged" 
        ShowLines="True">
        <DataBindings>
            <asp:TreeNodeBinding DataMember="pole" TextField="nazwa" ValueField="nazwa" />
        </DataBindings>
        <SelectedNodeStyle CssClass="treeSelectedNode" />
    </asp:TreeView>
    <asp:XmlDataSource ID="xmldsStrukturaRejestru" runat="server" 
        XPath="definicjaRejestru/pola/pole" EnableCaching="False">
    </asp:XmlDataSource>
    </td><td rowspan="3"><asp:Label ID="lblNazwaElementu" runat="server" Text="Nazwa elementu:" AssociatedControlID="txtNazwaElementu" />
        <br />
        <asp:TextBox ID="txtNazwaElementu" runat="server" Width="150px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvNazwaElementu" runat="server" 
            ControlToValidate="txtNazwaElementu" Display="Dynamic" ErrorMessage="*" 
            ValidationGroup="element">wymagane</asp:RequiredFieldValidator>
        <br />
        <asp:RegularExpressionValidator ID="revNazwaElementu" runat="server" 
            ControlToValidate="txtNazwaElementu" Display="Dynamic" 
            ValidationExpression="^(?!(xml|[_\d\W]))[^ \s\W]+$" ValidationGroup="element">nazwa 
        musi się zaczynać od litery, może zawierać litery, cyfry i znak &#39;_&#39;</asp:RegularExpressionValidator>
        <br />
        <asp:Label ID="lblTypElementu" runat="server" 
            AssociatedControlID="ddlTypElementu" Text="Typ elementu:"></asp:Label>
        <br />
        <asp:DropDownList ID="ddlTypElementu" runat="server" 
            Width="150px">
            <asp:ListItem Value="string">Tekst</asp:ListItem>
            <asp:ListItem Value="int">Liczba całkowita</asp:ListItem>
            <asp:ListItem Value="decimal">Liczba reczywista</asp:ListItem>
            <asp:ListItem Value="date">Data</asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />
        <asp:CheckBox ID="ckbRequiredField" runat="server" Text="Pole wymagane" />
        <br />
        <asp:CheckBox ID="ckbUseAsFilter" runat="server" 
            Text="Użyj pole do filtrowania" AutoPostBack="true"
            oncheckedchanged="ckbUseAsFilter_CheckedChanged" />
        <br />
        <asp:Label ID="lblPrefix" runat="server" Text="Przedrostek:"></asp:Label>
        <asp:TextBox ID="txtPrefix" runat="server" Width="100px"></asp:TextBox>
        <br />
        <asp:CheckBox ID="ckbWrapAfterElement" runat="server" 
            Text="Zawijaj po tym elemencie" />
        <br />
        <br />
        <asp:Label ID="lblEtykieta" runat="server" Text="Etykieta:"></asp:Label>
        <asp:TextBox ID="txtEtykieta" runat="server"></asp:TextBox>
        <br />
        <asp:CheckBox ID="ckbCreateColumns" runat="server" 
            Text="Niższy poziom tworzy kolumny w rejestrze" AutoPostBack="true" 
            oncheckedchanged="ckbCreateColumns_CheckedChanged" />
        <br />
                
        <asp:LinkButton ID="lnkAddElement" runat="server" onclick="lnkAddElement_Click"><span>Dodaj 
        nowy element</span></asp:LinkButton>
        <br />
                
        <asp:LinkButton ID="lnkAddNewElement" runat="server" Text="Dodaj element" 
            onclick="lnkAddNewElement_Click" ValidationGroup="element"></asp:LinkButton>
     
        <br />
        <asp:LinkButton ID="lnkSaveElement" runat="server" Text="Zapisz element" 
            onclick="lnkSaveElement_Click" ValidationGroup="element" />
        <br />
        <br />
        <asp:LinkButton ID="lnkRemoveElement" runat="server" 
            Text="Usuń element ze struktury" onclick="lnkRemoveElement_Click"></asp:LinkButton>
    </td></tr>
<tr><td>
    <asp:Label ID="lblMove" runat="server" Text="Przesuń element"></asp:Label>
    <br />
    <asp:LinkButton ID="lnkMoveUp" runat="server" onclick="lnkMoveUp_Click">w górę</asp:LinkButton>
    <br />
    <asp:LinkButton ID="lnkMoveDown" runat="server" onclick="lnkMoveDown_Click">w dół</asp:LinkButton>
    </td><td>
        &nbsp;</td></tr>
<tr><td>
    <asp:Label ID="lblMoveToGroup" runat="server" Text="Przenieś do grupy:"></asp:Label>
    <br />
    <asp:DropDownList ID="ddlGroupsList" runat="server" Width="150px">
    </asp:DropDownList>
    <br />
    <asp:LinkButton ID="lnkMoveToGroup" runat="server" Text="Przenieś" 
        onclick="lnkMoveToGroup_Click" />
    </td><td>
        <asp:LinkButton ID="lnkSaveDefinition" runat="server" Text="Zachowaj strukturę" 
            onclick="lnkSaveDefinition_Click" />
    </td></tr>
</table>
</fieldset>
<asp:Literal ID="litRegPreview" Mode="Transform" runat="server" Visible="false"></asp:Literal>
</div>
</asp:Content>