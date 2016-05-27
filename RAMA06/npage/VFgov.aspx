<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="VFgov.aspx.vb" Inherits="RAMA06.VFgov" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../ckeditor/ckeditor.js"></script>
    <link href="../Content/bootstrap.css" rel="stylesheet" />

     

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="container">
                <div class="messagealert" id="alert_container">
                </div>
                <asp:HiddenField ID="hdfid" runat="server" />
                <h2 class="text-center">ข่าวทุนรัฐบาล</h2>
                <asp:HiddenField ID="HiddenField1" runat="server" />
                <div class="panel panel-primary">
                    <div class="panel-body">
                        <div class="form-horizontal">

                            <div class="form-group">
                                <label class="col-md-3 control-label required">ชื่อทุน :</label>
                                <div class="col-md-7">
                                    <asp:TextBox ID="tbnamefound" runat="server" CssClass="form-control input-lg" placeholder="ชื่อทุน" ReadOnly="true"></asp:TextBox>
                                  
                                </div>

                            </div>

                            <hr />

                            <div class="form-group">
                                <label class="col-md-3 control-label" for="inputLarge">
                                    รายละเอียดทุน :
                                </label>
                                <p></p>

                            </div>
                            <div class="text-center">
                                <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                            </div>

                            <hr />

                            <div class="form-group">
                                <label class="col-md-3 control-label required">จำนวนทุน :</label>
                                <div class="col-md-2">
                                    <asp:TextBox ID="tbnumfound" runat="server" CssClass="form-control input-lg" placeholder="จำนวนทุน" ReadOnly="true"></asp:TextBox>
                                   
                                </div>

                            </div>

                            <div class="form-group">
                                <label class="col-md-3 control-label required">จำนวนเงินต่อทุน :</label>
                                <div class="col-md-3">
                                    <asp:TextBox ID="tbnummoneyfound" runat="server" CssClass="form-control input-lg" placeholder="จำนวนเงินต่อทุน" ReadOnly="true"></asp:TextBox>
                                
                                </div>

                            </div>

                            <div class="form-group">
                                <label class="col-md-3 control-label required">วันที่เริ่มให้ทุน :</label>
                                <div class="col-md-2">
                                    <asp:TextBox ID="tbdatefound" runat="server" CssClass="form-control input-lg" placeholder="วันที่เริ่มให้ทุน" ReadOnly="true"></asp:TextBox>
                               
                                </div>

                            </div>

                            <div class="form-group">
                                <label class="col-md-3 control-label required">วันที่สิ้นสุดให้ทุน :</label>
                                <div class="col-md-2">
                                    <asp:TextBox ID="tbendfound" runat="server" CssClass="form-control input-lg" placeholder="วันที่สิ้นสุดให้ทุน" ReadOnly="true"></asp:TextBox>
                                
                                </div>

                            </div>

                            <div class="form-group">
                                <label class="col-md-3 control-label required">ประเภททุน :</label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="tbtypefound" runat="server" CssClass="form-control input-lg" placeholder="ประเภททุน" ReadOnly="true"></asp:TextBox>
                                  
                                </div>

                            </div>


                            <hr />

                            <div class="table-responsive">
                                <asp:GridView ID="gvpic" DataKeyNames="ID_imgfound" runat="server" CssClass="table table-striped table-bordered table-hover" AutoGenerateColumns="False" AllowPaging="True" PageSize="20">
                                    <Columns>
                                        <asp:BoundField HeaderText="ลำดับ" DataField="row">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="ขื่อไฟล์" HeaderStyle-Width="1300px">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="btnnamefile" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "namefile") %>' CommandName="aviewfile" CommandArgument="<%#CType(Container, GridViewRow).RowIndex%>" ItemStyle-Width="1800px"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <%--<asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="btnDel" runat="server" Text="ลบ" CommandName="aDel" CommandArgument="<%#CType(Container, GridViewRow).RowIndex%>"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>--%>
                                    </Columns>

                                </asp:GridView>
                            </div>
                            <hr />

                        </div>

                    </div>

                </div>

            </div>
        </div>
    </form>
</body>
</html>
