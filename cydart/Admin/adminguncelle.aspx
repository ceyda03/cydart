﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="adminguncelle.aspx.cs" Inherits="cydart.Admin.adminguncelle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 class="page-title">Admin Kaydı Güncelleme</h2>

    <div class="card-deck">
        <div class="card shadow mb-4">
            <div class="card-body">
                <div class="form-group">
                    <label for="inputEmail4">Admin No</label>
                    <asp:TextBox ID="TextBox4" CssClass="form-control" placeholder="No" runat="server"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="inputEmail4">Ad</label>
                    <asp:TextBox ID="TextBox1" CssClass="form-control" placeholder="Ad" runat="server"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="inputEmail">Soyad</label>
                    <asp:TextBox ID="TextBox2" CssClass="form-control" placeholder="Soyad" runat="server"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="inputPassword4">Şifre</label>
                    <asp:TextBox ID="TextBox3" CssClass="form-control" TextMode="Password" placeholder="Şifre" runat="server"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="inputAddress">Yetki</label>
                    <asp:DropDownList ID="DropDownList1" CssClass="form-control select2" runat="server"></asp:DropDownList>
                </div>

                <div class="form-group">
                    <label for="inputAddress2">Fotoğraf</label> <br />
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                </div>
                
                <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="Kaydet" />
            </div>
        </div>
    </div>
</asp:Content>
