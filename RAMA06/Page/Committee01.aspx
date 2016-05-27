<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Committee01.aspx.vb" Inherits="RAMA06.Committee01" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>


</head>
<body>
<form id="form1" runat="server">
<br />
<div class="container">  
    <div><h3>รหัสโครงการ : 107</h3></div> 
    <div><h3>ชื่อโครงการวิจัย (Thai) : โครงการจัดทำคุณลักษณะที่เหมาะสมและมีประสิทธิภาพของสายสวนเพื่อขยายหลอดเลือดโคโรนารี่ด้วยบอลลูนและขดลวดค้ำยันผนังหลอดเลือด</h3> </div>
    <hr />
    <div><h1>บันทึกผล พิจารณาจริยธรรม(EC) โดย : รศ. จินตนันท์ ศรีสุยิ่ง</h1></div>
      <div class="panel panel-default">
                  <div class="panel-heading"> <strong> บันทึกผล การพิจารณาจริยธรรม (EC) </strong>
                      </div>
                     <div class="panel-body">       
                 <div class="panel-body">       
                     <div><strong>บันทึกการปฏิบัติและ หมายเหตุ</strong> </div>    
                     <div><textarea class="form-control" rows="10"></textarea> </div>    
                     <br />
                     <div class ="text-right"> <asp:FileUpload ID="FileUpload1" runat="server" />    </div>
                     <br />
                     <div class="text-right">สถานะ : <asp:DropDownList ID="DropDownList3" runat="server" Width="150px">
                         <asp:ListItem></asp:ListItem>
                         <asp:ListItem>ผ่าน</asp:ListItem>
                         <asp:ListItem>ไม่ผ่าน</asp:ListItem>
                         </asp:DropDownList></div>    
                     <br />
                     <div class="text-right"> 
                         <asp:Button ID="Button7" class="btn btn-primary" runat="server" Text="แก้ไข" /> 
                         &nbsp;<asp:Button ID="Button22" class="btn btn-primary" runat="server" Text="บันทึก" /> 
                     &nbsp;
      <button type="button" id="button1" class="btn btn-danger"  data-toggle="collapse" data-target="#bt3">แจ้งเรื่องกลับ</button>     
                     </div>
           <br />
           <div id="bt3" class="collapse" >
               <div class="alert alert-dismissable alert-danger"> 
                   <div>บันทึกการปฏิบัติและ หมายเหตุ (แจ้งเรื่องกลับ)</div> 
                   <div> <textarea class="form-control" rows="3" cols="20" name="S1"></textarea></div>
                    <br />
                   <div class ="text-right" ><asp:Button ID="Button23" class="btn btn-primary" runat="server" Text="ตกลง" /> 
                         </div>
                  
               </div>
            </div> 
                       
                     <br />  
                     <div class="text-right">ผู้บันทึก : XXXXXXXXX  โทร. XXXXXXX วันที่ 18 ก.ค. 2559 14:45:12 </div>    
                 </div>
              </div>

             </div>


        
</div>
    </form>
</body>
</html>
