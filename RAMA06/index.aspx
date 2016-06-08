<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MSPFirst.Master" CodeBehind="index.aspx.vb" Inherits="RAMA06.testindex" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
   <script type="text/javascript">
       $('#exampleModal').on('show.bs.modal', function (event) {
           var button = $(event.relatedTarget) // Button that triggered the modal
           var recipient = button.data('whatever') // Extract info from data-* attributes
           // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
           // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
           var modal = $(this)
           modal.find('.modal-title').text('New message to ' + recipient)
           modal.find('.modal-body input').val(recipient)
       })

    </script>
  <script type="text/javascript">
      $(document).ready(function () {
          /* Get iframe src attribute value i.e. YouTube video url
          and store it in a variable */
          var url = $("#cartoonVideo").attr('src');

          /* Assign empty url value to the iframe src attribute when
          modal hide, which stop the video playing */
          $("#myModal1").on('hide.bs.modal', function () {
              $("#cartoonVideo").attr('src', '');
          });

          /* Assign the initially stored url back to the iframe src
          attribute when modal is displayed again */
          $("#myModal1").on('show.bs.modal', function () {
              $("#cartoonVideo").attr('src', url);
          });
      });
</script>

 

    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <div class="text-center">
        <asp:LinkButton ID="btnshowgov" runat="server" class="btn btn-primary btn-outline btn-lg">
                          &nbsp;ข่าวทุนรัฐบาล
        </asp:LinkButton>
        <asp:LinkButton ID="btnshowout" runat="server" class="btn btn-primary btn-outline btn-lg">
                          &nbsp;ข่าวทุนเอกชน
        </asp:LinkButton>
        <asp:LinkButton ID="btnshowother" runat="server" class="btn btn-primary btn-outline btn-lg" CausesValidation="false">
                          &nbsp;ข่าวประชาสัมพันธ์ทั่วไป
        </asp:LinkButton>
      

    </div>

  
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel"></h4>
                </div>
                <div class="modal-body">



                    <div class="form-group">
                        <label for="recipient-name" class="control-label">เรื่อง:</label>
                        <asp:TextBox ID="tbheadname" runat="server" CssClass="form-control" placeholder="ชื่อPopup" ReadOnly="true"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="message-text" class="control-label">รายละเอียด:</label>
                        <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                    </div>


                    <div class="table-responsive">
                        <asp:GridView ID="gvpicmodal" DataKeyNames="id_imgoss_popup" runat="server" CssClass="table table-striped table-bordered table-hover" AutoGenerateColumns="False" AllowPaging="True" PageSize="20">
                            <Columns>
                                <asp:BoundField HeaderText="ลำดับ" DataField="row">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="ขื่อไฟล์" HeaderStyle-Width="1300px">
                                    <ItemTemplate>
                                        <asp:Literal ID="ltr1" runat="server"></asp:Literal>
                                        <asp:LinkButton ID="btnnamefile" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "namefile") %>' CommandName="aviewfile" CommandArgument="<%#CType(Container, GridViewRow).RowIndex%>" ItemStyle-Width="1800px"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>

                        </asp:GridView>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

                </div>
            </div>
        </div>
    </div>

 


  

    <div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel1"></h4>
                </div>
                <div class="modal-body">

                    <div class="text-center">
                        <asp:Literal ID="ltr2" runat="server" Visible="false"></asp:Literal>
                        <div class="form-group">

                            <asp:TextBox ID="tbheadnamevideo" runat="server" CssClass="form-control" placeholder="ชื่อPopup" ReadOnly="true"></asp:TextBox>
                        </div>
                        <video id="vdo" runat="server" autoplay="autoplay" controls></video>

                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

                </div>
            </div>
        </div>
    </div>

  



    <div class="modal fade" id="myModalslid" tabindex="-1" role="dialog" aria-labelledby="myModalLabelslid">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabelpic">แจ้งประกาศ</h4>
                </div>
                <div class="modal-body">


                    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                   
                        <ol class="carousel-indicators">
                            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="3"></li>
                        </ol>

          
                        <div class="carousel-inner" role="listbox">
                       


                            <asp:Repeater ID="images" runat="server">
                                <AlternatingItemTemplate>
                                    <div class="item active">
                                        <img src="http://10.6.22.114/RAMA06/RAMA06/files-uploads/<%# Eval("renamefile").ToString()%>" style="width: 888px; height: 388px"
                                            class="img-responsive" />
                                     
                                    </div>
                                </AlternatingItemTemplate>

                                <ItemTemplate>
                                    <div class="item">

                                        <img src="http://10.6.22.114/RAMA06/RAMA06/files-uploads/<%# Eval("renamefile").ToString() %>" style="width: 888px; height: 388px"
                                            class="img-responsive" />
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>


             
                        </div>
                               
                        
                        <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>


                    </div>


                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

                </div>
            </div>
        </div>
    </div>




    <asp:MultiView ID="multiview1" runat="server" ActiveViewIndex="0">

        <asp:View ID="viewshowgov" runat="server">

            <asp:HiddenField ID="hdffrequency" runat="server" />
            <asp:HiddenField ID="HiddenField3" runat="server" />
            <br />
            <div class="text-center">
                <%--  <h1 class="panel-title">ข่าวประชาสัมพันธ์ทั่วไป</h1>--%>
                <h2>ข่าวทุนรัฐบาล</h2>
            </div>


            <div class="form-inline" style="padding-bottom: 10px;">
                <div class="form-group">
                    <asp:TextBox ID="tbsearcht1" runat="server" CssClass="form-control" autofocus="autofocus" placeholder="คำค้นหา..."></asp:TextBox>
                </div>
                <asp:LinkButton ID="btnsearcht1" runat="server" CssClass="btn btn-primary btn-lg">
                         <span class="glyphicon glyphicon-search"></span> &nbsp;ค้นหา
                </asp:LinkButton>

            </div>


            <div class="table-responsive">
                <asp:GridView ID="gvdatat1" DataKeyNames="IDfound" runat="server" CssClass="table table-bordered table-striped table-hover"
                    AllowPaging="true" AllowSorting="true" PageSize="20" AutoGenerateColumns="false" ShowFooter="false">
                    <Columns>
                        <asp:BoundField HeaderText="ลำดับ" DataField="row" ItemStyle-Width="90px">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                        <asp:BoundField HeaderText="วันที่ลง" DataField="datesend" DataFormatString="{0:MM/dd/yyyy}" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="150px">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>


                        <asp:TemplateField HeaderText="ชื่อทุน">
                            <ItemTemplate>
                                <asp:LinkButton ID="btntopic" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "namefound") %>' CommandName="aname" CommandArgument="<%#CType(Container, GridViewRow).RowIndex%>" ItemStyle-Width="150px"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:BoundField HeaderText="จำนวนทุน" DataField="numfound" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="80px">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                        <asp:BoundField HeaderText="จำนวนเงินต่อทุน" DataField="nummoneyfound" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="80px">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                        <asp:BoundField HeaderText="วันที่เริ่มให้" DataField="datefound" DataFormatString="{0:MM/dd/yyyy}" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="100px">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                        <asp:BoundField HeaderText="วันที่สิ้นสุดให้ทุน" DataField="endfound" DataFormatString="{0:MM/dd/yyyy}" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="80px">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                        <asp:BoundField HeaderText="ประเภททุน" DataField="typefound" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="300px">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>




                    </Columns>
                    <EmptyDataTemplate>
                        ไม่พบข้อมูล
                    </EmptyDataTemplate>
                </asp:GridView>
            </div>


            <asp:HiddenField ID="HiddenField4" runat="server" />
            <asp:HiddenField ID="HiddenField5" runat="server" />
            <p></p>
            <div class="form-inline">
                <div class="form-group">
                    <label class="control-label" for="<%=ddlPaget1.ClientID %>">หน้า</label>
                </div>
                <div class="form-group">
                    <asp:DropDownList ID="ddlPaget1" runat="server" CssClass="form-control" AutoPostBack="true">
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <label class="control-label">จากทั้งหมด</label>
                    <asp:Label ID="lblAllPaget1" runat="server" CssClass="control-label"></asp:Label>
                    <label class="control-label">หน้า</label>
                </div>
            </div>
            <p></p>
        </asp:View>


        <asp:View ID="viewshowout" runat="server">
            <asp:HiddenField ID="HiddenField1" runat="server" />
            <br />
            <div class="text-center">

                <h2>ข่าวทุนเอกชน</h2>
            </div>


            <div class="form-inline" style="padding-bottom: 10px;">
                <div class="form-group">
                    <asp:TextBox ID="tbsearcht2" runat="server" CssClass="form-control" autofocus="autofocus" placeholder="คำค้นหา..."></asp:TextBox>
                </div>
                <asp:LinkButton ID="btnsearcht2" runat="server" CssClass="btn btn-primary btn-lg">
                         <span class="glyphicon glyphicon-search"></span> &nbsp;ค้นหา
                </asp:LinkButton>

            </div>


            <div class="table-responsive">
                <asp:GridView ID="gvdatat2" DataKeyNames="IDpriv" runat="server" CssClass="table table-bordered table-striped table-hover"
                    AllowPaging="true" AllowSorting="true" PageSize="20" AutoGenerateColumns="false" ShowFooter="false">
                    <Columns>
                        <asp:BoundField HeaderText="ลำดับ" DataField="row" ItemStyle-Width="90px">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                        <asp:BoundField HeaderText="วันที่ลงข่าว" DataField="datesend" DataFormatString="{0:MM/dd/yyyy}" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="150px">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>


                        <asp:TemplateField HeaderText="เรื่อง" ItemStyle-Width="900px">
                            <ItemTemplate>

                                <asp:LinkButton ID="btntopic" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "privHead") %>' CommandName="aEdit" CommandArgument="<%#CType(Container, GridViewRow).RowIndex%>" ItemStyle-Width="750px"></asp:LinkButton>

                                <asp:Image ID="image" runat="server" ImageUrl="~/Images/new1.jpg" Visible="true" />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="lbldateend" runat="server" Text='<%# Eval("dateend") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="lblstatusactionicon" runat="server" Text='<%# Eval("statusicon") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>




                    </Columns>
                    <EmptyDataTemplate>
                        ไม่พบข้อมูล
                    </EmptyDataTemplate>
                </asp:GridView>
            </div>


            <p></p>
            <div class="form-inline">
                <div class="form-group">
                    <label class="control-label" for="<%=ddlPage.ClientID %>">หน้า</label>
                </div>
                <div class="form-group">
                    <asp:DropDownList ID="ddlPaget2" runat="server" CssClass="form-control" AutoPostBack="true">
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <label class="control-label">จากทั้งหมด</label>
                    <asp:Label ID="lblAllPaget2" runat="server" CssClass="control-label"></asp:Label>
                    <label class="control-label">หน้า</label>
                </div>
            </div>
            <p></p>

        </asp:View>

        <asp:View ID="vother" runat="server">
            <asp:HiddenField ID="hdfid" runat="server" />
            <br />
            <div class="text-center">

                <h2>ข่าวประชาสัมพันธ์ทั่วไป</h2>
            </div>


            <div class="form-inline" style="padding-bottom: 10px;">
                <div class="form-group">
                    <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" autofocus="autofocus" placeholder="คำค้นหา..."></asp:TextBox>
                </div>
                <asp:LinkButton ID="bttnsearch" runat="server" CssClass="btn btn-primary btn-lg">
                         <span class="glyphicon glyphicon-search"></span> &nbsp;ค้นหา
                </asp:LinkButton>

            </div>


            <div class="table-responsive">
                <asp:GridView ID="gvData" DataKeyNames="IDNew" runat="server" CssClass="table table-bordered table-striped table-hover"
                    AllowPaging="true" AllowSorting="true" PageSize="20" AutoGenerateColumns="false" ShowFooter="false">
                    <Columns>
                        <asp:BoundField HeaderText="ลำดับ" DataField="row" ItemStyle-Width="90px">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                        <asp:BoundField HeaderText="วันที่ลงข่าว" DataField="datesend" DataFormatString="{0:MM/dd/yyyy}" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="150px">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>


                        <asp:TemplateField HeaderText="เรื่อง" ItemStyle-Width="900px">
                            <ItemTemplate>

                                <asp:LinkButton ID="btntopic" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "newHead") %>' CommandName="aEdit" CommandArgument="<%#CType(Container, GridViewRow).RowIndex%>" ItemStyle-Width="750px"></asp:LinkButton>

                                <asp:Image ID="image" runat="server" ImageUrl="~/Images/new1.jpg" Visible="true" />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="lbldateend" runat="server" Text='<%# Eval("dateend") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="lblstatusactionicon" runat="server" Text='<%# Eval("statusicon") %>'></asp:Label>
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
            </div>
            <p></p>
        </asp:View>

    </asp:MultiView>




</asp:Content>
