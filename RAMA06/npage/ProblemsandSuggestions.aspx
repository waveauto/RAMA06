<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MSP01.Master" CodeBehind="ProblemsandSuggestions.aspx.vb" Inherits="RAMA06.ProblemsandSuggestions" ValidateRequest="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script src="../ckeditor/ckeditor.js"></script>

    <style type="text/css">
        .messagealert {
            width: 40%;
            /*position: fixed;*/
            top: 200px;
            z-index: 70000;
            padding: 0;
            font-size: 15px;
            width: auto;
            height: 20px;
            line-height: 20px;
        }
    </style>

    <script type="text/javascript">
        function ShowMessage(message, messagetype) {
            var cssclass;
            switch (messagetype) {
                case 'Success':
                    cssclass = 'alert-success'
                    break;
                case 'Error':
                    cssclass = 'alert-danger'
                    break;
                case 'Warning':
                    cssclass = 'alert-warning'
                    break;
                default:
                    cssclass = 'alert-info'
            }
            $('#alert_container').append('<div id="alert_div" style="margin: 0 0.5%; -webkit-box-shadow: 3px 4px 6px #999;" class="alert fade in ' + cssclass + '"><a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a><strong>' + messagetype + '!</strong> <span>' + message + '</span></div>');

            setTimeout(function () {
                $("#alert_div").fadeTo(2000, 500).slideUp(500, function () {
                    $("#alert_div").remove();
                });
            }, 5000);//5000=5 seconds
        }
    </script>
    
    <script>
        $(function () {

            CKEDITOR.replace('<%=tbProblemsdetial.ClientID%>', { filebrowserImageUploadUrl: '../ckeditor/Upload.ashx' });
          
        });

    </script>
 


   <%-- <script>
        $(document).ready(function () {

            $('#<%=tbdatesend.ClientID%>').datetimepicker({
                format: "m/d/Y",
                timepicker: false
            });
        });
    </script>--%>

   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:MultiView ID="multiveiw" runat="server" ActiveViewIndex="0">
        <asp:View ID="viewshow" runat="server">
            <asp:HiddenField ID="hdfmode" runat="server" />
            <asp:HiddenField ID="hdfid" runat="server" />
            <asp:HiddenField id="hdfIDProblems" runat="server"/>
            <div class="form-inline" style="padding-bottom: 10px;">
                <div class="form-group">
                    <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" autofocus="autofocus" placeholder="คำค้นหา..."></asp:TextBox>
                </div>
                <asp:LinkButton ID="btnSearch" runat="server" CssClass="btn btn-primary btn-lg">
                         <span class="glyphicon glyphicon-search"></span> &nbsp;ค้นหา
                </asp:LinkButton>
                <asp:LinkButton ID="btnNew" runat="server" CssClass="btn btn-primary btn-lg">
                         <span class="glyphicon glyphicon-plus"></span> &nbsp;เพิ่มใหม่
                </asp:LinkButton>

            </div>
            <div class="form-horizontal">
                <div class="table-responsive">
                    <asp:GridView ID="gvData" DataKeyNames="IDProblems" runat="server" CssClass="table table-bordered table-striped table-hover"
                        AllowPaging="true" AllowSorting="true" PageSize="20" AutoGenerateColumns="false" ShowFooter="false">
                        <Columns>
                            <asp:BoundField HeaderText="ลำดับ" DataField="row" ItemStyle-Width="100px">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>

                            <asp:BoundField HeaderText="วันที่กรอก" DataField="datesend" DataFormatString="{0:MM/dd/yyyy}" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="200px">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>


                            <asp:BoundField HeaderText="ชื่อปัญหาและข้อเสนอแนะ" DataField="Problemshead" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="800px">
                                <HeaderStyle HorizontalAlign="left" />
                                <ItemStyle HorizontalAlign="left" />
                            </asp:BoundField>

                        

                            <asp:BoundField HeaderText="สถานะ" DataField="statusProblems" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="200px">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>

                                                  

                            <asp:TemplateField HeaderText="วิธีการแก้ไข">
                                <ItemTemplate>
                                    <asp:LinkButton ID="btntopic" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "howto") %>' CommandName="atopic" CommandArgument="<%#CType(Container, GridViewRow).RowIndex%>"></asp:LinkButton>
                                   
                                </ItemTemplate>
                                 <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="ตรวจสอบ" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnEdit" runat="server" Text="ตรวจสอบ" CommandName="aEdit"
                                        CommandArgument='<%# CType(Container, GridViewRow).RowIndex %>'></asp:LinkButton>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>


                        </Columns>
                        <EmptyDataTemplate>
                            ไม่พบข้อมูล
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
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


            




        </asp:View>

        <asp:View ID="viewadd" runat="server">


            <div class="container">
                <div class="messagealert" id="alert_container">
                </div>

                <h2 class="text-center">ปัญหาและข้อเสนอแนะ</h2>

                <div class="panel panel-primary">
                    <div class="panel-body">
                        <div class="form-horizontal">



                            <div class="form-group">
                                <label class="col-md-3 control-label required">ชื่อปัญหาและข้อเสนอแนะ :</label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="tbProblemshead" runat="server" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rqfvtxtName" runat="server" ControlToValidate="tbProblemshead" Display="Dynamic" CssClass="label label-danger">
                             กรุณากรอกชื่อปัญหาและข้อเสนอแนะ
                                    </asp:RequiredFieldValidator>
                                </div>

                            </div>
                            <hr />
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="inputLarge">
                                    รายละเอียดปัญหาและข้อเสนอแนะ :
                                </label>
                            </div>


                            <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                            <asp:TextBox ID="tbProblemsdetial" runat="server" class="form-control input-lg" Height="47px" TextMode="MultiLine"></asp:TextBox>

                            <hr />
                          <%--  <div class="form-group">
                                <div class="form-group">
                                    <label class="col-md-3 control-label required">วันที่ลงข้อมูล :</label>
                                    <div class="col-md-2">
                                        <asp:TextBox ID="tbdatesend" runat="server" CssClass="form-control"></asp:TextBox>

                                    </div>

                                </div>
                            </div>--%>

                            <div class="form-group">
                                <label class="col-md-3" for="comment">แนบไฟล์ (ถ้ามี)</label>
                                <asp:FileUpload ID="FileUpload4" class="form-control input-lg" runat="server" />
                                <hr />
                                <div class="col-md-4">
                                    <asp:LinkButton ID="btnupload" runat="server" CssClass="btn btn-primary btn-lg" CausesValidation="false">
                                    <span class="glyphicon glyphicon-circle-arrow-down"></span> &nbsp;Upload File
                                    </asp:LinkButton>
                                </div>
                               
                            </div>

                            <hr />
                            <div class="table-responsive">
                                <asp:GridView ID="gvpic" DataKeyNames="id_imgoss_Problems" runat="server" CssClass="table table-striped table-bordered table-hover" AutoGenerateColumns="False" AllowPaging="True" PageSize="20">
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

                                        <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="btnDel" runat="server" Text="ลบ" CommandName="aDel" CommandArgument="<%#CType(Container, GridViewRow).RowIndex%>"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>

                                </asp:GridView>
                            </div>


                            <hr />

                            <div class="text-center">
                               <%-- <asp:LinkButton ID="btnpreview" runat="server" CssClass="btn btn-primary btn-lg">
                         <span class="glyphicon glyphicon-expand"></span> &nbsp;Preview
                                </asp:LinkButton>--%>
                                <asp:LinkButton ID="btnsave" runat="server" CssClass="btn btn-primary btn-lg">
                         <span class="glyphicon glyphicon-floppy-disk"></span> &nbsp;บันทึกข้อมูล
                                </asp:LinkButton>

                            </div>
                            <asp:LinkButton ID="btnback" runat="server" CssClass="btn btn-default btn-lg" CausesValidation="false">
                         <span class="glyphicon glyphicon-chevron-left"></span> &nbsp;กลับหน้าเมนู
                            </asp:LinkButton>

                        </div>
                        
                        



                    </div>

                </div>

            </div>
        </asp:View>

        <asp:View ID="viewhowto" runat="server">
            <div class="container">
                <div class="panel panel-primary">
                    <div class ="panel-body">
                         <h2>ปัญหาและข้อเสนอแนะ</h2>
                        <div class="form-horizontal">


                            <div class="form-group">
                                <label class="control-label col-md-3" for="inputLarge">
                                  </label>
                                <div class="form-group col-md-3">
                                    <asp:Literal ID="ltrdetail" runat="server"></asp:Literal>
                                </div>
                                <br />



                            </div>


                          
                            
                            <hr />

                             

                        </div>

                    </div>

                </div>
                <br />
                <div class="panel panel-primary">
                    <div class="panel-body">
                        <h2>วิธีการแก้ไขปัญหา</h2>
                        <div class="form-horizontal">
                            <div class="form-group">
                                <label class="control-label col-md-3" for="inputLarge">
                                    </label>
                                <div class="form-group col-md-3">
                                    <asp:Literal ID="ltrhowto" runat="server"></asp:Literal>
                                </div>

                            </div>
                        </div>
                        
                        


                    </div>

                </div>
                <asp:LinkButton ID="btnbackhowto" runat="server" CssClass="btn btn-default btn-lg" CausesValidation="false">
                         <span class="glyphicon glyphicon-chevron-left"></span> &nbsp;กลับหน้าเมนู
                </asp:LinkButton>

            </div>
        </asp:View>

    </asp:MultiView>
</asp:Content>
