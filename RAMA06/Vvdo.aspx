<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MSPFirst.Master" CodeBehind="Vvdo.aspx.vb" Inherits="RAMA06.Vvdo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:MultiView ID="mutiview1" runat="server" ActiveViewIndex="0">
        <asp:View ID="viewshow" runat="server">
            <h2></h2>
            <div class="table-responsive">
                <div class="text-center">
                    <asp:DataList ID="DataList1" Visible="true" runat="server" AutoGenerateColumns="false"
                        RepeatColumns="4" Width="100%" CellSpacing="100" CellPadding="5" class="vex-res">
                        <ItemTemplate>
                            <hr />
                            <u>
                                <%# Eval("Headvideo")%></u>
                            <p></p>
                            <hr />

                            <div class="col-xs-6 col-sm-3">
                                <a class="player" style="height: 400px; width: 400px; display: block" href='<%# Eval("IDvideo", "npage/VideoHandler.ashx?Id={0}") %>'></a>
                            </div>

                        </ItemTemplate>
                    </asp:DataList>
                    <script src="FlowPlayer/flowplayer-3.2.12.min.js" type="text/javascript"></script>
                    <script type="text/javascript">
                        flowplayer("a.player", "FlowPlayer/flowplayer-3.2.16.swf", {
                            plugins: {
                                pseudo: { url: "FlowPlayer/flowplayer.pseudostreaming-3.2.12.swf" }
                            },
                            clip: { provider: 'pseudo', autoPlay: false },
                        });
                    </script>
                </div>
            </div>
            <p></p>


            <%--   <asp:HiddenField ID="hdfIDmanual" runat="server" />
            <asp:HiddenField ID="hdfmode" runat="server" />
            <h2 class="text-center">วิดีโอสอนการใช้งานระบบ</h2>

            <div class="form-inline" style="padding-bottom: 10px;">
                <div class="form-group">
                    <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control input-lg" autofocus="autofocus" placeholder="คำค้นหา..."></asp:TextBox>
                </div>
                <asp:LinkButton ID="btnSearch" runat="server" CssClass="btn btn-primary btn-lg">
                         <span class="glyphicon glyphicon-search"></span> &nbsp;ค้นหา
                </asp:LinkButton>
              

            </div>

            <div class="table-responsive">
                <asp:GridView ID="gvData" DataKeyNames="IDvideo" runat="server" CssClass="table table-bordered table-striped table-hover"
                    AllowPaging="true" AllowSorting="true" PageSize="20" AutoGenerateColumns="false" ShowFooter="false">
                    <Columns>
                        <asp:BoundField HeaderText="ลำดับ" DataField="row" ItemStyle-Width="90px">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                       
                        <asp:TemplateField HeaderText="ชื่อวิดีโอคู่มือ">
                            <ItemTemplate>
                                <asp:LinkButton ID="btntopic" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Headvideo") %>' CommandName="aname" CommandArgument="<%#CType(Container, GridViewRow).RowIndex%>" ItemStyle-Width="150px"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>



                    </Columns>
                    <EmptyDataTemplate>
                        ไม่พบข้อมูล
                    </EmptyDataTemplate>
                </asp:GridView>
            </div>


            <asp:HiddenField ID="hdfSortField" runat="server" />
            <asp:HiddenField ID="hdfSortDirectoin" runat="server" />
            <p></p>
            <div class="form-inline">
                <div class="form-group">
                    <label class="control-label" for="<%=ddlPage.ClientID %>">หน้า</label>
                </div>
                <div class="form-group">
                    <asp:DropDownList ID="ddlPage" runat="server" CssClass="form-control" AutoPostBack="true">
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <label class="control-label">จากทั้งหมด</label>
                    <asp:Label ID="lblAllPage" runat="server" CssClass="control-label"></asp:Label>
                    <label class="control-label">หน้า</label>
                </div>
            </div>--%>

            <%--<asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                    <object id="player"
                        classid="clsid:6BF52A52-394A-11D3-B153-00C04F79FAA6"
                        height="170" width="300">
                        <param name="url"
                            value='<%# string.Format("VideoHandler.ashx?IDvideo={0}", Eval("IDvideo")) %>'  />
                        <param name="showcontrols" value="true" />
                        <param name="autostart" value="true" />
                    </object>
                </ItemTemplate>
            </asp:Repeater>--%>

            <%-- <asp:DataList ID="DataList1" Visible="true" runat="server" AutoGenerateColumns="false"
                RepeatColumns="2" CellSpacing="5">
                <ItemTemplate>
                    <u>
                        <%# Eval("Headvideo") %></u>
                    <hr />
                    <a class="player" style="height: 300px; width: 300px; display: block" href='<%# Eval("IDvideo", "npage/VideoHandler.ashx?IDvideo={0}") %>'></a>
                </ItemTemplate>
            </asp:DataList>--%>



            <%--            <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-default btn-lg" CausesValidation="false">
                         <span class="glyphicon glyphicon-chevron-left"></span> &nbsp;gmเทส
            </asp:LinkButton>--%>
        </asp:View>
        <asp:View ID="viewdisplay" runat="server">
            <h2 class="text-center">วิดีโอสอนการใช้งานระบบ</h2>





            <%--            <div class="text-center">
                <div class="embed-responsive embed-responsive-16by9">
                    <iframe id="ifrem" runat="server" class="embed-responsive-item"  frameborder="0" width="640" height="480"></iframe>
                </div>
            </div>--%>




            <%-- <div class="entry">
                <div class="Wrapper">
                    <iframe id="video" runat="server" name="video_iframe"  frameborder="0"></iframe>
                 
                </div>
            </div>--%>



            <p></p>
            <asp:LinkButton ID="btnback" runat="server" CssClass="btn btn-default btn-lg" CausesValidation="false">
                         <span class="glyphicon glyphicon-chevron-left"></span> &nbsp;กลับหน้าเมนู
            </asp:LinkButton>

            <p></p>
        </asp:View>

    </asp:MultiView>

</asp:Content>
