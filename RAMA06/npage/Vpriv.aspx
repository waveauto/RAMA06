<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Vpriv.aspx.vb" Inherits="RAMA06.Vpriv" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
      <link href="../Content/bootstrap.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="container">
                <div class="messagealert" id="alert_container">
                </div>
                <asp:HiddenField ID="hdfid" runat="server" />
                <h2 class="text-center">ข่าวทุนเอกชน</h2>
                <asp:HiddenField ID="HiddenField1" runat="server" />
                <div class="panel panel-primary">
                    <div class="panel-body">
                        <div class="form-horizontal">
                            <div class="form-group">
                                <label class="col-md-3 control-label required">ชื่อทุนเอกชน :</label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="tbprivHead" runat="server" CssClass="form-control input-lg" ReadOnly="true"></asp:TextBox>

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
                                <label class="col-md-2 control-label" for="inputLarge">
                                    เอกสารแนบ :
                                </label>
                            </div>
                            <div class="table-responsive">
                                <asp:GridView ID="gvpic" DataKeyNames="id_imgoss_foundpriv" runat="server" CssClass="table table-striped table-bordered table-hover" AutoGenerateColumns="False" AllowPaging="True" PageSize="20">
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
                            <hr />


                        </div>

                    </div>

                </div>

            </div>
        </div>
    </form>
</body>
</html>
