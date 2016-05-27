<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="ucSelectProject.ascx.vb" Inherits="RAMA06.ucSelectProject" %>
<h3>
    เลือกโครงการ
</h3>
<asp:GridView ID="gvData" runat="server" AutoGenerateColumns="false" DataKeyNames="pjID" CssClass="table table-bordered">
    <Columns>
        <asp:BoundField HeaderText="ลำดับ">
            <HeaderStyle HorizontalAlign="Center" />
            <ItemStyle HorizontalAlign="Center" />
        </asp:BoundField>

         <asp:BoundField HeaderText="เรื่อง" DataField="pjName">
            <HeaderStyle HorizontalAlign="Center" />
            <ItemStyle HorizontalAlign="Left" />
        </asp:BoundField>

        <asp:TemplateField HeaderText="เลือก">
            <ItemTemplate>
                <asp:LinkButton ID="btnSelect" runat="server" CommandName="aSelect" CommandArgument="<%# CType(Container, GridViewRow).RowIndex %>">เลือก</asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>

    </Columns>
</asp:GridView>

<div class="text-right">
    <p>
        <button type="button" id="btnUcSelectNewPj" class="btn btn-success">
            เพิ่มโครงการใหม่
        </button>
        <asp:Button ID="btnCancel" runat="server" CssClass="btn btn-danger" Text="ยกเลิก" />
    </p>
</div>

<div id="divUcSelectAddNew" style="display: none;">
    <h3>เพิ่มโครงการวิจัยใหม่</h3>
    <div class="form-horizontal">
        <div class="form-group">
            <label class="col-md-3 control-label">โครงการวิจัยเรื่อง(ไทย) :</label>
            <div class="col-md-7">
                <asp:TextBox ID="txtPjNameThai" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
            </div>
        </div>

        <div class="form-group">
            <label class="col-md-3 control-label">โครงการวิจัยเรื่อง(อังกฤษ) :</label>
            <div class="col-md-7">
                <asp:TextBox ID="txtPjNameEng" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
            </div>
        </div>

        <div class="form-group">
            <label class="col-md-3 control-label">กำหนดสานะ :</label>
            <div class="col-md-2">
                <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-control"></asp:DropDownList>
            </div>
        </div>

        <div class="form-group">
            <label class="col-md-3 control-label">เอกสารแนบ :</label>
            <div class="col-md-6">
                <asp:FileUpload ID="FileUpload1" runat="server"></asp:FileUpload>
            </div>
        </div>

        <div class="form-group">
            <div class="col-md-6 col-md-offset-3">
                <asp:Button ID="btnSave" runat="server" CssClass="btn btn-success" Text="บันทึก" />
                <button type="button" id="btnCancelSave" class="btn btn-danger">
                    ยกเลิก
                </button>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        $("#btnUcSelectNewPj").on('click', function () {
            $("#divUcSelectAddNew").toggle(400);
        });
        $("#btnCancelSave").on('click', function () {
            $("#divUcSelectAddNew").hide(400);
        });
    });
</script>