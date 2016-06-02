<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="poptext.aspx.vb" Inherits="RAMA06.poptext" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Content/bootstrap.css" rel="stylesheet" />

    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <p></p>
        <div class="container">
            <div class="panel panel-primary">
                <div class="panel-body">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label class="col-md-3 control-label required">เรื่อง :</label>
                            <div class="col-md-6">
                                <asp:TextBox ID="tbheadname" runat="server" CssClass="form-control input-lg" placeholder="ชื่อPopup" ReadOnly="true"></asp:TextBox>

                            </div>

                        </div>

                        <div class="form-group">
                            <label class="col-md-4 control-label required"></label>
                            <div class="col-md-6">
                                <asp:Literal ID="ltrdetail" runat="server"></asp:Literal>
                            </div>

                        </div>
                        <hr />
                        <div class="table-responsive">
                            <asp:GridView ID="gvpic" DataKeyNames="id_imgoss_popup" runat="server" CssClass="table table-striped table-bordered table-hover" AutoGenerateColumns="False" AllowPaging="True" PageSize="20">
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


                                </Columns>

                            </asp:GridView>
                        </div>


                    </div>
                </div>

            </div>
        </div>
    </form>
</body>
</html>
