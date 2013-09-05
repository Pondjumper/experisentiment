<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Home Page
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
      
    <h2><%: ViewData["Message"] %></h2>
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
     
        <asp:View ID="View1" runat="server">     
        
            <asp:ImageMap ID="ImageMap1" 
                  ImageUrl="~/Images/monkgun.jpg"
                runat="server">
            </asp:ImageMap>
         
        </asp:View>
        <asp:View ID="View2" runat="server">
                <img src="../../Images/forestfire.jpg" alt=""/>
        </asp:View>
    </asp:MultiView>
</asp:Content>
