<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MSP01.Master" CodeBehind="Asecu.aspx.vb" Inherits="RAMA06.Asecu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:MultiView ID="mutiview1" runat="server" ActiveViewIndex="0">
        <asp:View ID="viewshow" runat="server">
            <asp:HiddenField ID="hdfmode" runat="server" />
            <asp:HiddenField ID="hdfid" runat="server" />
            <asp:HiddenField ID="hdfIDNew" runat="server" />

            <h2 class="text-center">ข่าว</h2>

            <div class="form-inline" style="padding-bottom: 10px;">
                <div class="form-group">
                    <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" autofocus="autofocus" placeholder="คำค้นหา..."></asp:TextBox>
                </div>
                <asp:LinkButton ID="btnSearch" runat="server" CssClass="btn btn-primary btn-lg">
                         <span class="glyphicon glyphicon-search"></span> &nbsp;ค้นหา
                </asp:LinkButton>

            </div>

            <div class="table-responsive">
                <asp:GridView ID="gvData" DataKeyNames="codestaff" runat="server" CssClass="table table-bordered table-striped table-hover"
                    AllowPaging="true" AllowSorting="true" PageSize="20" AutoGenerateColumns="false" ShowFooter="false">
                    <Columns>
                        <asp:BoundField HeaderText="ลำดับ" DataField="row">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                        <asp:BoundField HeaderText="ชื่อ" DataField="name" HeaderStyle-HorizontalAlign="Center">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                        <asp:BoundField HeaderText="ระดับสิทธิ์" DataField="namelevel" HeaderStyle-HorizontalAlign="Center">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                      
                        <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnDel" runat="server" Text="แก้ไขข้อมูลระดับสิทธิ์" CommandName="aDit" CommandArgument="<%#CType(Container, GridViewRow).RowIndex%>"></asp:LinkButton>
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

        </asp:View>

        <asp:View ID="viewedit" runat="server">
            <div class="container">
                <div class="form-group">
                    <div class="messagealert" id="alert_container">
                    </div>
                </div>
                <h2 class="text-center">กำหนดสิทธิ์</h2>
                <div class="panel panel-primary">
                    <div class="panel-body">

                        <p></p>

                        <div class="form-horizontal">

                            <div class="row">


                                <div class="col-md-8">
                                    <div class="form-group">
                                        <label class="control-label col-md-6" for="inputLarge">
                                            รหัสบุคคล :</label>
                                        <div class="col-md-4">
                                            <asp:TextBox ID="tbcodestaff" runat="server" class="form-control input-lg" ReadOnly="true"></asp:TextBox>
                                        </div>
                                    </div>

                                    <br />
                                    <div class="form-group">
                                        <label class="control-label col-md-6" for="inputLarge">
                                            ตำแหน่งทางวิชาการ (ถ้ามี) : เช่น ผศ. รศ. ศ. ฯลฯ :</label>
                                        <div class="col-md-4">
                                            <asp:TextBox ID="tbposition" runat="server" placeholder="ตำแหน่งทางวิชาการ" class="form-control input-lg" ReadOnly="true"></asp:TextBox>
                                            
                                        </div>

                                    </div>

                                </div>
                                <div class="col-md-4">
                                    <asp:Image ID="Image1" Height="170px" Width="150px" class="img-thumbnail" runat="server" />
                                </div>
                            </div>



                            <div class="form-group">
                                <label class="control-label col-md-4" for="inputLarge">
                                    ยศ (ถ้ามี) :</label>
                                <div class="col-md-3 col-sm-3">


                                    <asp:TextBox ID="tbrank" runat="server" placeholder="ยศ" class="form-control input-lg" ReadOnly="true"></asp:TextBox>
                                    
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-4" for="inputLarge">
                                    วุฒิการศึกษาระดับปริญญาดุษฎีบัณฑิต: เช่น ดร. :</label>
                                <div class="col-md-3">


                                    <asp:TextBox ID="tbeducation" runat="server" placeholder="วุฒิการศึกษาระดับปริญญาดุษฎีบัณฑิต" class="form-control input-lg" ReadOnly="true"></asp:TextBox>
                                    
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-4" for="inputLarge">
                                    ตำแหน่งวิชาชีพ (ถ้ามี) : เช่น นพ. พญ.&nbsp; ฯลฯ</label>
                                <div class="col-md-2">


                                    <asp:TextBox ID="tbprofession" runat="server" placeholder="ตำแหน่งวิชาชีพ" class="form-control input-lg" ReadOnly="true"></asp:TextBox>
                                   
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-4" for="inputLarge">
                                    ฐานันดรศักดิ์ หรือ คำนำหน้าสตรี (ถ้ามี) :</label>
                                <div class="col-md-2">


                                    <asp:TextBox ID="tbdignity" runat="server" placeholder="ฐานันดรศักดิ์" class="form-control input-lg" ReadOnly="true"></asp:TextBox>
                                    
                                </div>
                            </div>

                            
                              <div class="form-group">
                                <label class="control-label col-md-4" for="inputLarge">
                                   คำนำหน้า: :</label>
                                <div class="col-md-2">

                                     <asp:TextBox ID="tbfname" runat="server" placeholder="คำนำหน้า" class="form-control input-lg" ReadOnly="true"></asp:TextBox>
                             
                                    
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-4" for="inputLarge">
                                    ชื่อ-สกุล :</label>
                                <div class="col-md-4">


                                    <asp:TextBox ID="tbname" runat="server" placeholder="ชื่อ-สกุล" class="form-control input-lg" ReadOnly="true"></asp:TextBox>
                                  
                                </div>
                            </div>


                            <div class="form-group">
                                <label class="control-label col-md-4" for="inputLarge">
                                    เบอร์โทรหน่วยงาน :</label>
                                <div class="col-md-4">


                                    <asp:TextBox ID="tbtel" runat="server" placeholder="เบอร์โทรหน่วยงาน" class="form-control input-lg" ReadOnly="true"></asp:TextBox>
                                 
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-4" for="inputLarge">
                                    เบอร์โทรมือถือ :</label>
                                <div class="col-md-4">


                                    <asp:TextBox ID="tbmobile" runat="server" placeholder="เบอร์โทรมือถือ" class="form-control input-lg" ReadOnly="true"></asp:TextBox>
                                    
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-4" for="inputLarge">
                                    E-mail :</label>
                                <div class="col-md-4">


                                    <asp:TextBox ID="tbemail" runat="server" placeholder="E-mail" class="form-control input-lg" ReadOnly="true"></asp:TextBox>
                                   
                                </div>
                            </div>

                             <div class="form-group">
                                <label class="control-label col-md-4" for="inputLarge">
                                    สิทธิ์การเข้าระบบ :</label>
                                <div class="col-md-4">


                                    <asp:TextBox ID="tblevel" runat="server" placeholder="E-mail" class="form-control input-lg" ReadOnly="true"></asp:TextBox>
                                   
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-4" for="inputLarge">
                                    สิทธิ์การเข้าระบบ:
                                </label>
                                <div class="col-md-2">

                                    <asp:DropDownList ID="ddllevel" class="form-control input-lg" runat="server">
                                    </asp:DropDownList>

                                </div>
                            </div>



                        </div>

                        <div class="text-center">
                            <asp:LinkButton ID="btnsave" runat="server" CssClass="btn btn-primary btn-lg">
                         <span class="glyphicon glyphicon-floppy-disk"></span> &nbsp;ยืนยันการกำหนดสิทธิ์
                            </asp:LinkButton>
                        </div>
                        <asp:LinkButton ID="btnback" runat="server" CssClass="btn btn-default btn-lg" CausesValidation="false">
                         <span class="glyphicon glyphicon-chevron-left"></span> &nbsp;กลับหน้าเมนู
                        </asp:LinkButton>

                    </div>

                </div>
            </div>

        </asp:View>



    </asp:MultiView>

</asp:Content>
