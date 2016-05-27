<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MSP01.Master" CodeBehind="InputProposal.aspx.vb" Inherits="RAMA06.InputProposal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">    
   <h1 class ="text-left">ส่งโครงการวิจัย : </h1>
   <div class="panel panel-primary">
          <div class="container">   
      <div class="panel-body"> 
         <div class="row">
                  <div class="col-md-1"></div>
                  <div class="col-md-1"></div>
                  <div class="col-md-1"></div>
                  <div class="col-md-1"></div>
                  <div class="col-md-1"></div>
                  <div class="col-md-1"></div>
                  <div class="col-md-1"></div>
                  <div class="col-md-1"></div>
                  <div class="col-md-1"></div>
                  <div class="col-md-1"></div>
                  <div class="col-md-1"><asp:Label ID="Label1" class="control-label" runat="server" Text="รหัส : XXXXX" Font-Bold="True" Width="100px"></asp:Label> </div>
        </div>   
               
          <div class ="text-center"><img src="../../Images/mahidol_logo150.png" /></div>
          <br />   
          <div class ="text-center"><asp:Label ID="lblDate" runat="server" Font-Bold="True"></asp:Label></div> 
          <br />
          <div class="row">          
                <div class="col-md-11">
                     <label class="control-label"> ชื่อโครงการวิจัย (Thai) :</label>
                     <asp:TextBox ID="TextBox7" class="form-control input-lg" placeholder="ชื่อโครงการวิจัย (Thai)" runat="server"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="TextBox7" Display="Dynamic" CssClass="label label-danger">
                         กรุณากรอก
                     </asp:RequiredFieldValidator>
                </div>
           </div>
           <br />

          <div class="row">          
                <div class="col-md-11">
                     <label class="control-label"> ชื่อโครงการวิจัย (Eng) :</label>
                     <asp:TextBox ID="TextBox6" class="form-control input-lg" placeholder="ชื่อโครงการวิจัย (Eng)" runat="server"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox7" Display="Dynamic" CssClass="label label-danger">
                         กรุณากรอก
                     </asp:RequiredFieldValidator>
                </div>
           </div>
           <br />

<%--          <div class="row">          
                <div class="col-md-8">
                     <label class="control-label"> XXXXXXXXX :</label>
                     <asp:TextBox ID="TextBox5" class="form-control input-lg" placeholder="Text input" runat="server"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox7" Display="Dynamic" CssClass="label label-danger">
                         กรุณากรอก
                     </asp:RequiredFieldValidator>
                </div>
           </div>
           <br />
 
          <div class="row">          
                <div class="col-md-6">
                     <label class="control-label"> XXXXXXXXX :</label>
                     <asp:TextBox ID="TextBox4" class="form-control input-lg" placeholder="Text input" runat="server"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox7" Display="Dynamic" CssClass="label label-danger">
                         กรุณากรอก
                     </asp:RequiredFieldValidator>
                </div>
           </div>
           <br />

          <div class="row">          
                <div class="col-md-6">
                     <label class="control-label"> XXXXXXXXX :</label>
                     <asp:TextBox ID="TextBox1" class="form-control input-lg" placeholder="Text input" runat="server"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox7" Display="Dynamic" CssClass="label label-danger">
                         กรุณากรอก
                     </asp:RequiredFieldValidator>
                </div>
           </div>
           <br />

          <div class="row">          
                <div class="col-md-12">
                     <label class="control-label"> XXXXXXXXX :</label>
                     <asp:TextBox ID="TextBox2" class="form-control input-lg" placeholder="Text input" runat="server" Height="150px" TextMode="MultiLine"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox7" Display="Dynamic" CssClass="label label-danger">
                         กรุณากรอก
                     </asp:RequiredFieldValidator>
                </div>
           </div>
           <br />

          <div class="row">          
                <div class="col-md-6">
                     <label class="control-label"> XXXXXXXXX :</label>
                     <asp:TextBox ID="TextBox3" class="form-control input-lg" placeholder="Text input" runat="server"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox7" Display="Dynamic" CssClass="label label-danger">
                         กรุณากรอก
                     </asp:RequiredFieldValidator>
                </div>
           </div>
           <br />--%>
<br />

<hr />
<div class="panel panel-default">
   <div class="panel-heading">คณะผู้ร่วมวิจัย</div>
        <div class="panel-body">       
          <table>
              <thead>
                  <tr>
                      <th class="auto-style7">
                          <asp:TextBox ID="TextBox32" runat="server"></asp:TextBox>
                      </th>
                      <th class="auto-style7">
                          <asp:TextBox ID="TextBox33" runat="server"></asp:TextBox>
                      </th>
                      <th class="auto-style7">
                          <asp:TextBox ID="TextBox34" runat="server"></asp:TextBox>
                      </th>
                      <th class="auto-style7">
                          <asp:TextBox ID="TextBox35" runat="server"></asp:TextBox>
                          <asp:Button ID="Button1" runat="server" Text="Add" />
                      </th>
                  </tr>
                  <tr>
                      <th>รหัส</th>
                      <th>ชื่อ-สกุล</th>
                      <th>สถานะ</th>
                      <th>ร้อยละการมีส่วนร่วม (%)</th>
                  </tr>
              </thead>
              <tr class="success">
                  <td class="auto-style4">011696</td>
                  <td class="auto-style4"><a href='<%= Page.ResolveUrl("~/Page/Proposal.aspx")%>' target="_blank">ผศ.นพ.สุรเดช ดวงทิพย์สิริกุล</a></td>
                  <td class="auto-style4"><a href='<%= Page.ResolveUrl("~/Page/Detail-person.aspx")%>' target="_blank">ผู้วิจัยหลัก</a></td>
                  <td class="auto-style4">ร้อยละการมีส่วนร่วม:60%</td>
              </tr>
              <tr>
                  <td class="auto-style5">011456</td>
                  <td class="auto-style5"><a href='<%= Page.ResolveUrl("~/Page/Proposal.aspx")%>' target="_blank">ดร.ภญ.ศิตาพร ยังคง</a></td>
                  <td class="auto-style5"><a href='<%= Page.ResolveUrl("~/Page/Detail-person.aspx")%>' target="_blank">ผู้วิจัยร่วม</a></td>
                  <td class="auto-style5">ร้อยละการมีส่วนร่วม:10%</td>
              </tr>
              <tr class="success">
                  <td class="auto-style6">01376</td>
                  <td class="auto-style6"><a href='<%= Page.ResolveUrl("~/Page/Detail-person.aspx")%>'>นายทรงยศ พิลาสันต์</a></td>
                  <td class="auto-style6"><a href='<%= Page.ResolveUrl("~/Page/Detail-person.aspx")%>' target="_blank">ผู้วิจัยร่วม</a></td>
                  <td class="auto-style6">ร้อยละการมีส่วนร่วม:10%</td>
              </tr>
              <tr>
                  <td>01566</td>
                  <td><a href='<%= Page.ResolveUrl("~/Page/Detail-person.aspx")%>' target="_blank">ภญ.ศตนันทน์ มณีอ่อน</a></td>
                  <td><a href='<%= Page.ResolveUrl("~/Page/Detail-person.aspx")%>' target="_blank">ผู้วิจัยร่วม</a></td>
                  <td>ร้อยละการมีส่วนร่วม:20%</td>
              </tr>
          </table>

       </div>
</div>


<div class="panel panel-default">
   <div class="panel-heading">ข้อมูลเกี่ยวกับโครงการวิจัย</div>
        <div class="panel-body">
            <div class="row">
              <div class="col-md-8">
                  <div class="form-group">
                    <label class="control-label" for="inputLarge">ประเภทโครงการวิจัย :</label>
                        <asp:DropDownList ID="DropDownList9" runat="server" class="form-control input-lg">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>โครงการวิจัยหลัก</asp:ListItem>
                        <asp:ListItem>โครงการวิจัยย่อย</asp:ListItem>
                        </asp:DropDownList>        
                    </div> 
              </div> 
            </div>
                  
            <div class="row">
              <div class="col-md-8">
                  <div class="form-group">
                    <label class="control-label" for="inputLarge">ประเภททุนที่ขอ :</label>
                        <asp:DropDownList ID="DropDownList4" runat="server" class="form-control input-lg">
                        <asp:ListItem></asp:ListItem>
                        </asp:DropDownList>        
                    </div> 
              </div>
 
            </div>           
            
            <div class="row">
              <div class="col-md-8">
                  <div class="form-group">
                    <label class="control-label" for="inputLarge">กลุ่มทุน :</label>
                        <asp:DropDownList ID="DropDownList2" runat="server" class="form-control input-lg">
                        <asp:ListItem></asp:ListItem>
                        </asp:DropDownList>        
                    </div> 
              </div>
 
            </div>                       

            <div class="row">
              <div class="col-md-8">
                  <div class="form-group">
                    <label class="control-label" for="inputLarge">ชื่อทุน :</label>
                        <asp:DropDownList ID="DropDownList1" runat="server" class="form-control input-lg">
                        <asp:ListItem></asp:ListItem>
                        </asp:DropDownList>        
                    </div> 
              </div> 
            </div>

            <div class="row">
              <div class="col-md-8">
                  <div class="form-group">
                    <label class="control-label" for="inputLarge">โครงการวิจัยจัดอยู่ในกลุ่มโรคใด :</label>
                        <asp:DropDownList ID="DropDownList5" runat="server" class="form-control input-lg">
                        <asp:ListItem></asp:ListItem>
                        </asp:DropDownList>        
                    </div> 
              </div> 
            </div>

            <div class="row">
              <div class="col-md-8">
                  <div class="form-group">
                    <label class="control-label" for="inputLarge">วิจัยเกี่ยวกับ คลินิก/ไม่คลินิก :</label>
                        <asp:DropDownList ID="DropDownList7" runat="server" class="form-control input-lg">
                        <asp:ListItem></asp:ListItem>
                        </asp:DropDownList>        
                    </div> 
              </div> 
            </div>

            <div class="row">
              <div class="col-md-8">
                  <div class="form-group">
                    <label class="control-label" for="inputLarge">เป็นโครงการวิจัย เกี่ยวกับคนใช่หรือไม่ :</label>
                        <asp:DropDownList ID="DropDownList8" runat="server" class="form-control input-lg">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>ใช่</asp:ListItem>
                        <asp:ListItem>ไม่</asp:ListItem>
                        </asp:DropDownList>        
                    </div> 
                  </div> 
             </div>
        </div>
</div>

<div class="panel panel-default">
   <div class="panel-heading">แนนไฟล์</div>
        <div class="panel-body">       
             <div class="form-group">
             <label for="comment">แนนไฟล์ โครงการวิจัย :</label>
               <div class="row">
                   <div class="col-md-4"><asp:FileUpload ID="FileUpload1" class="form-control" runat="server" /></div>
                   <asp:HyperLink ID="HyperLink2" runat="server">แบบฟอร์มโครงการวิจัย /R2R</asp:HyperLink>
               </div>
               <br />   
               <div class="row">
                   <div class="col-md-4"><asp:FileUpload ID="FileUpload2" class="form-control" runat="server" /></div>
                   <asp:HyperLink ID="HyperLink3" runat="server">แบบฟอร์มผู้บังคับบัญชาอนุญาติ</asp:HyperLink>
               </div>
               <br /> 
               <div class="row">
                   <div class="col-md-4"><asp:FileUpload ID="FileUpload4" class="form-control" runat="server" /></div>
                   <asp:HyperLink ID="HyperLink4" runat="server">แบบฟอร์มขอจริยธรรม (กรณีที่ทำวิจัยเกี่ยวกับคน)</asp:HyperLink>
               </div>
               <br /> 
               <div class="row">
                   <div class="col-md-4"><asp:FileUpload ID="FileUpload7" class="form-control" runat="server" /></div>
                   <asp:HyperLink ID="HyperLink7" runat="server">เอกสารอื่นๆ (ถ้ามี)</asp:HyperLink>
               &nbsp;<asp:Button ID="Button3" class="btn btn-success" runat="server" Text="เพิ่ม" />
               </div>
               <br />

       </div> 
       </div>
</div>

<hr />

<div class ="text-center"><asp:Button ID="Button2" class="btn btn-primary btn-lg" runat="server" Text="ยึนยันการส่งข้อมูล" Width="205px" />&nbsp;<asp:Button ID="Button4" class="btn btn-primary btn-lg" runat="server" Text="บันทึกฉบับร่าง" Width="205px" /></div>

 </div>


        </div>
  </div>

   <div class="panel panel-primary">
          <div class="panel-body">   
              <asp:HyperLink ID="HyperLink1" runat="server">View</asp:HyperLink>
          </div>
   </div>


  </div>
    <br />
</asp:Content>
