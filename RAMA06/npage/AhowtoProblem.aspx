<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MSP01.Master" CodeBehind="AhowtoProblem.aspx.vb" Inherits="RAMA06.AhowtoProblem" ValidateRequest="false" %>
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
         $(document).on("click", "[id*=lnkView]", function () {
             $("#id").html($(".Id", $(this).closest("tr")).html());
             $("#name").html($(".Name", $(this).closest("tr")).html());
             $("#description").html($(".Description", $(this).closest("tr")).html());
             $("#dialog").dialog({
                 title: "View Details",
                 buttons: {
                     Ok: function () {
                         $(this).dialog('close');
                     }
                 },
                 modal: true
             });
             return false;
         });
</script>

    <script>
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


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:MultiView ID="multiview" runat="server" ActiveViewIndex="0">
        <asp:View ID="viewshow" runat="server">
            <asp:HiddenField ID="hdfmode" runat="server" />
            <asp:HiddenField ID="hdfid" runat="server" />
            <asp:HiddenField ID="hdfrid" runat="server" />
            
            <h2 class="text-center">แก้ไขปัญหาและข้อเสนอแนะ</h2>

            <div class="form-inline" style="padding-bottom: 10px;">
                <div class="form-group">
                    <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" autofocus="autofocus" placeholder="คำค้นหา..."></asp:TextBox>
                </div>
                <asp:LinkButton ID="btnSearch" runat="server" CssClass="btn btn-primary btn-lg">
                         <span class="glyphicon glyphicon-search"></span> &nbsp;ค้นหา
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

                            <asp:BoundField HeaderText="วันที่กรอก" DataField="datesend" DataFormatString="{0:MM/dd/yyyy}" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="120px">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>


                            <asp:BoundField HeaderText="ชื่อปัญหาและข้อเสนอแนะ" DataField="Problemshead" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="900px">
                                <HeaderStyle HorizontalAlign="left" />
                                <ItemStyle HorizontalAlign="left" />
                            </asp:BoundField>

                        

                            <asp:BoundField HeaderText="สถานะ" DataField="statusProblems" HeaderStyle-HorizontalAlign="Center">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>

                            <asp:TemplateField HeaderText="ชื่อผู้ส่ง">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <asp:LinkButton ID="btntopic" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "name") %>' CommandName="aname" CommandArgument="<%#CType(Container, GridViewRow).RowIndex%>" ItemStyle-Width="750px"></asp:LinkButton>
                                  
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="lblstatusactionicon" runat="server" Text='<%# Eval("codestaff") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>


                            <asp:TemplateField HeaderText="ข้อแนะนำแก้ไขปัญหา">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnEdit" runat="server" Text="แก้ไขปัญหา" CommandName="aEdit"
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

        <asp:View ID="viewhowto" runat="server">
           
            <div class="container">
                
                <div class="panel panel-primary">
                    <div class="panel-body">
                        <div class="messagealert" id="alert_container">
                        </div>
                        <h2 class="text-center">ปัญหาและข้อเสนอแนะ</h2>
                        <br />
                        <br />
                        <div class="form-horizontal">

                            <div class="form-group">
                                <label class="col-md-3 control-label required">ชื่อปัญหาและข้อเสนอแนะ :</label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="tbProblemshead" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rqfvtxtName" runat="server" ControlToValidate="tbProblemshead" Display="Dynamic" CssClass="label label-danger">
                             กรุณากรอกชื่อปัญหาและข้อเสนอแนะ
                                    </asp:RequiredFieldValidator>
                                </div>

                            </div>



                            <div class="form-group">
                                <label class="control-label col-md-3" for="inputLarge">
                                    ปัญหาและข้อเสนอแนะ :</label>
                                <div class="form-group col-md-3">
                                    <asp:Literal ID="ltrdetail" runat="server"></asp:Literal>
                                </div>
                                <br />

                            </div>
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


                                    </Columns>

                                </asp:GridView>
                            </div>
                           

                            


                        </div>

                    </div>

                </div>


                <div class="panel panel-primary">
                    <div class="panel-body">
                         <h2 class="text-center">วิธีแก้ปัญหาและข้อเสนอแนะ</h2>

                        <div class="form-horizontal">
                            
                            <div class="form-group">
                                
                                <label class="col-md-3 control-label " for="inputLarge">
                                    การรับเรื่อง :</label>
                                <label class="radio-inline">
                                    <asp:RadioButton ID="rdreligious1" GroupName="religious" runat="server" Text="รับเรื่อง" />
                                </label>
                                <label class="radio-inline">
                                    <asp:RadioButton ID="rdreligious2" GroupName="religious" runat="server" Text="อยู่ในระหว่างการแก้ไขปัญหา" />
                                </label>
                                <label class="radio-inline">
                                    <asp:RadioButton ID="rdreligious3" GroupName="religious" runat="server" Text="แก้ไขปัญหาเรียบร้อยแล้ว" />
                                </label>
                            </div>
                             <hr />


                            <div class="form-group">
                                <label class="col-md-3 control-label" for="inputLarge">
                                    วิธีการแก้ไขปัญหา :
                                </label>
                            </div>
                            <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                            <asp:TextBox ID="tbProblemsdetial" runat="server" class="form-control input-lg" Height="47px" TextMode="MultiLine"></asp:TextBox>

                            <hr />

                            <hr />
                           
                            <div class="text-center">
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


    </asp:MultiView>

</asp:Content>
