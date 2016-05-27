<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MSP01.Master" CodeBehind="ShowProposal.aspx.vb" Inherits="RAMA06.ShowProposal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="container">
<br />
<div>
    <asp:HyperLink ID="HyperLink1" class="btn btn-info btn-lg" runat="server">ส่งโครงการวิจัย</asp:HyperLink></div>
<br />
<h2>ข้อมูลโครงการวิจัย</h2>       
  <ul class="nav nav-tabs">
     <li class="active"><a data-toggle="tab" href="#Tab1">ทั้งหมด <span class="badge">1809</span></a></li>
     <li><a data-toggle="tab" href="#Tab2">พิจารณารับเรื่อง <span class="badge">19</span></a></li>
     <li><a data-toggle="tab" href="#Tab3">ทุนภายในคณะฯ <span class="badge">9</span></a></li>  
     <li><a data-toggle="tab" href="#Tab4">ทุนภายนอกคณะฯ <span class="badge">3</span></a></li>
     <li><a data-toggle="tab" href="#Tab5">ทุนรัฐบาล <span class="badge">5</span></a></li>
     <li><a data-toggle="tab" href="#Tab6">ทุนเอกชน <span class="badge">6</span></a></li>
     <li><a data-toggle="tab" href="#Tab7">จริยธรรม(EC) <span class="badge">10</span></a></li>      
  </ul>
  <div class="tab-content">  
     <div id="Tab1" class="tab-pane fade in active">
            <h3 class ="text-center ">ข้อมูลโครงการวิจัยทั้งหมด</h3>
              <div>
                    <button class="btn btn-info btn-lg" data-target="#myModal" data-toggle="modal" type="button">ค้นหา</button>
                     <button class="btn btn-info btn-lg" data-target="#myModal" data-toggle="modal" type="button">Export to Excel</button>              <a href="StepStaff.aspx">StepStaff.aspx</a> <a href="StepUser.aspx">StepUser.aspx</a></div> 
             <br />  
              <br />   
          <div class="panel panel-primary">
                    <div class="panel-heading">
                    <h1 class="panel-title">รายการ</h1 >
                 </div>
                <div class="table-responsive">
                <div class ="text-center"> 
                 <i>หน้าที่ <%=gvDataTab1.PageIndex + 1%> จาก <%=gvDataTab1.PageCount%> </i>
           </div>
               <asp:GridView ID="gvDataTab1" runat="server" CssClass="table table-bordered table-hover"
                        AllowPaging="true" AllowSorting="true" PageSize="30" AutoGenerateColumns="false" ShowFooter="false">
                        <Columns>
                            <asp:TemplateField HeaderText="ลำดับ">
                                  <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                  </ItemTemplate>
                            </asp:TemplateField>                 

                            <asp:BoundField HeaderText="ID" DataField="ID" SortExpression="ID">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>

                             <asp:BoundField HeaderText="วันที่" DataField="DateTime" SortExpression="DateTime">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>

                          <%--  <asp:BoundField HeaderText="เรื่อง" DataField="Topic" SortExpression="Topic">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>--%>
                
                            <asp:TemplateField HeaderText="ชื่อทุน" SortExpression="Topic">
                                <ItemTemplate>
                                     <asp:HyperLink ID="selectLink" runat="server" 
                                         NavigateUrl='<%#"~/Page/MainRecord/View-News.aspx?id=" + Eval("Topic").ToString()%>' 
                                        Target="_Blank" Text='<%# Bind("Topic")%>' />
                                </ItemTemplate>
                           </asp:TemplateField>

                          <asp:BoundField HeaderText="จำนวนทุน" DataField="CountFund" SortExpression="CountFund">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>

                            <asp:BoundField HeaderText="จำนวนทุนคงเหลือ" DataField="FunReal" SortExpression="FunReal">
                                <HeaderStyle HorizontalAlign="Center" ForeColor="red"/>
                                <ItemStyle HorizontalAlign="Left" ForeColor="red" />
                            </asp:BoundField>

                             <asp:BoundField HeaderText="จำนวนเงินต่อทุน" DataField="MuneyPerFund" SortExpression="MuneyPerFund">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>

                           <asp:BoundField HeaderText="วันที่เริ่มให้ทุน" DataField="Start_date" SortExpression="Start_date">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                                 
                            <asp:BoundField HeaderText="วันที่สิ้นสุดให้ทุน" DataField="End_date" SortExpression="End_date">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                                                                 
                            <asp:BoundField HeaderText="จำนวนวันคงเหลือ" DataField="Endday" SortExpression="Endday">
                                <HeaderStyle HorizontalAlign="Center" ForeColor="red"/>
                                <ItemStyle HorizontalAlign="Left" ForeColor="red"/>
                            </asp:BoundField>
                
                             <asp:BoundField  HeaderText="แหล่งทุน" DataField="From_Fund" SortExpression="From_Fund">
                                <HeaderStyle HorizontalAlign="Center"  />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>

                             <asp:BoundField HeaderText="ประเภททุน" DataField="Type_Fund" SortExpression="Type_Fund">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>

                            <asp:BoundField HeaderText="อ่าน" DataField="Hits" SortExpression="Hits">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>

                        </Columns>
                        <EmptyDataTemplate>
                            ไม่พบข้อมูล
                        </EmptyDataTemplate>
                        <PagerSettings Position="TopAndBottom" />
                 </asp:GridView>
               <div class ="text-center"> 
                      <i>หน้าที่ <%=gvDataTab1.PageIndex + 1%> จาก <%=gvDataTab1.PageCount%> </i>
                    </div>
              </div>
             </div> 
         </div>
     <div id="Tab2"  class="tab-pane fade">
            <h3 class ="text-center ">พิจารณารับเรื่อง (รอการพิจารณารับเรื่อง) </h3>
             <button class="btn btn-info btn-lg" data-target="#myModal" data-toggle="modal" type="button">ค้นหา</button>
              <br />  
              <br />   
                 <div class="panel panel-primary">
                    <div class="panel-heading">
                    <h1 class="panel-title">รายการ</h1 >
                 </div>
                <div class="table-responsive">
                <div class ="text-center"> 
                 <i>หน้าที่ <%=gvDataTab4.PageIndex + 1%> จาก <%=gvDataTab4.PageCount%> </i>
           </div>
               <asp:GridView ID="GridView3" runat="server" CssClass="table table-bordered table-hover"
                        AllowPaging="true" AllowSorting="true" PageSize="30" AutoGenerateColumns="false" ShowFooter="false">
                        <Columns>
                            <asp:TemplateField HeaderText="ลำดับ">
                                  <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                  </ItemTemplate>
                            </asp:TemplateField>                 

                            <asp:BoundField HeaderText="ID" DataField="ID" SortExpression="ID">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>

                             <asp:BoundField HeaderText="วันที่" DataField="DateTime" SortExpression="DateTime">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>

                          <%--  <asp:BoundField HeaderText="เรื่อง" DataField="Topic" SortExpression="Topic">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>--%>
                
                            <asp:TemplateField HeaderText="ชื่อทุน" SortExpression="Topic">
                                <ItemTemplate>
                                     <asp:HyperLink ID="selectLink" runat="server" 
                                         NavigateUrl='<%#"~/Page/MainRecord/View-News.aspx?id=" + Eval("Topic").ToString()%>' 
                                        Target="_Blank" Text='<%# Bind("Topic")%>' />
                                </ItemTemplate>
                           </asp:TemplateField>

                          <asp:BoundField HeaderText="จำนวนทุน" DataField="CountFund" SortExpression="CountFund">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>

                            <asp:BoundField HeaderText="จำนวนทุนคงเหลือ" DataField="FunReal" SortExpression="FunReal">
                                <HeaderStyle HorizontalAlign="Center" ForeColor="red"/>
                                <ItemStyle HorizontalAlign="Left" ForeColor="red" />
                            </asp:BoundField>

                             <asp:BoundField HeaderText="จำนวนเงินต่อทุน" DataField="MuneyPerFund" SortExpression="MuneyPerFund">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>

                           <asp:BoundField HeaderText="วันที่เริ่มให้ทุน" DataField="Start_date" SortExpression="Start_date">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                                 
                            <asp:BoundField HeaderText="วันที่สิ้นสุดให้ทุน" DataField="End_date" SortExpression="End_date">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                                                                 
                            <asp:BoundField HeaderText="จำนวนวันคงเหลือ" DataField="Endday" SortExpression="Endday">
                                <HeaderStyle HorizontalAlign="Center" ForeColor="red"/>
                                <ItemStyle HorizontalAlign="Left" ForeColor="red"/>
                            </asp:BoundField>
                
                             <asp:BoundField  HeaderText="แหล่งทุน" DataField="From_Fund" SortExpression="From_Fund">
                                <HeaderStyle HorizontalAlign="Center"  />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>

                             <asp:BoundField HeaderText="ประเภททุน" DataField="Type_Fund" SortExpression="Type_Fund">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>

                            <asp:BoundField HeaderText="อ่าน" DataField="Hits" SortExpression="Hits">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>

                        </Columns>
                        <EmptyDataTemplate>
                            ไม่พบข้อมูล
                        </EmptyDataTemplate>
                        <PagerSettings Position="TopAndBottom" />
                 </asp:GridView>
               <div class ="text-center"> 
                      <i>หน้าที่ <%=gvDataTab4.PageIndex + 1%> จาก <%=gvDataTab4.PageCount%> </i>
                    </div>
              </div>
             </div> 
         </div>
     <div id="Tab3"  class="tab-pane fade">
            <h3 class ="text-center ">ทุนภายใน คณะแพทยศาสตร์โรงพยาบาลรามาธิบดี (รอกำหนดกรรมการพิจารณาทุน)</h3>
             <button class="btn btn-info btn-lg" data-target="#myModal" data-toggle="modal" type="button">ค้นหา</button>
              <br />  
              <br />   
                 <div class="panel panel-primary">
                    <div class="panel-heading">
                    <h1 class="panel-title">รายการ</h1 >
                 </div>
                <div class="table-responsive">
                <div class ="text-center"> 
                 <i>หน้าที่ <%=gvDataTab2.PageIndex + 1%> จาก <%=gvDataTab2.PageCount%> </i>
           </div>
               <asp:GridView ID="gvDataTab2" runat="server" CssClass="table table-bordered table-hover"
                        AllowPaging="true" AllowSorting="true" PageSize="30" AutoGenerateColumns="false" ShowFooter="false">
                        <Columns>
                            <asp:TemplateField HeaderText="ลำดับ">
                                  <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                  </ItemTemplate>
                            </asp:TemplateField>                 

                            <asp:BoundField HeaderText="ID" DataField="ID" SortExpression="ID">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>

                             <asp:BoundField HeaderText="วันที่" DataField="DateTime" SortExpression="DateTime">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>

                          <%--  <asp:BoundField HeaderText="เรื่อง" DataField="Topic" SortExpression="Topic">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>--%>
                
                            <asp:TemplateField HeaderText="ชื่อทุน" SortExpression="Topic">
                                <ItemTemplate>
                                     <asp:HyperLink ID="selectLink" runat="server" 
                                         NavigateUrl='<%#"~/Page/MainRecord/View-News.aspx?id=" + Eval("Topic").ToString()%>' 
                                        Target="_Blank" Text='<%# Bind("Topic")%>' />
                                </ItemTemplate>
                           </asp:TemplateField>

                          <asp:BoundField HeaderText="จำนวนทุน" DataField="CountFund" SortExpression="CountFund">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>

                            <asp:BoundField HeaderText="จำนวนทุนคงเหลือ" DataField="FunReal" SortExpression="FunReal">
                                <HeaderStyle HorizontalAlign="Center" ForeColor="red"/>
                                <ItemStyle HorizontalAlign="Left" ForeColor="red" />
                            </asp:BoundField>

                             <asp:BoundField HeaderText="จำนวนเงินต่อทุน" DataField="MuneyPerFund" SortExpression="MuneyPerFund">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>

                           <asp:BoundField HeaderText="วันที่เริ่มให้ทุน" DataField="Start_date" SortExpression="Start_date">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                                 
                            <asp:BoundField HeaderText="วันที่สิ้นสุดให้ทุน" DataField="End_date" SortExpression="End_date">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                                                                 
                            <asp:BoundField HeaderText="จำนวนวันคงเหลือ" DataField="Endday" SortExpression="Endday">
                                <HeaderStyle HorizontalAlign="Center" ForeColor="red"/>
                                <ItemStyle HorizontalAlign="Left" ForeColor="red"/>
                            </asp:BoundField>
                
                             <asp:BoundField  HeaderText="แหล่งทุน" DataField="From_Fund" SortExpression="From_Fund">
                                <HeaderStyle HorizontalAlign="Center"  />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>

                             <asp:BoundField HeaderText="ประเภททุน" DataField="Type_Fund" SortExpression="Type_Fund">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>

                            <asp:BoundField HeaderText="อ่าน" DataField="Hits" SortExpression="Hits">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>

                        </Columns>
                        <EmptyDataTemplate>
                            ไม่พบข้อมูล
                        </EmptyDataTemplate>
                        <PagerSettings Position="TopAndBottom" />
                 </asp:GridView>
               <div class ="text-center"> 
                      <i>หน้าที่ <%=gvDataTab2.PageIndex + 1%> จาก <%=gvDataTab2.PageCount%> </i>
                    </div>
              </div>
             </div> 
         </div>
     <div id="Tab4"  class="tab-pane fade">
            <h3 class ="text-center ">ทุนภายใน คณะแพทยศาสตร์โรงพยาบาลรามาธิบดี (รอกำหนดกรรมการพิจารณาทุน)</h3>
             <button class="btn btn-info btn-lg" data-target="#myModal" data-toggle="modal" type="button">ค้นหา</button>
              <br />  
              <br />   
                 <div class="panel panel-primary">
                    <div class="panel-heading">
                    <h1 class="panel-title">รายการ</h1 >
                 </div>
                <div class="table-responsive">
                <div class ="text-center"> 
                 <i>หน้าที่ <%=gvDataTab3.PageIndex + 1%> จาก <%=gvDataTab3.PageCount%> </i>
           </div>
               <asp:GridView ID="gvDataTab3" runat="server" CssClass="table table-bordered table-hover"
                        AllowPaging="true" AllowSorting="true" PageSize="30" AutoGenerateColumns="false" ShowFooter="false">
                        <Columns>
                            <asp:TemplateField HeaderText="ลำดับ">
                                  <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                  </ItemTemplate>
                            </asp:TemplateField>                 

                            <asp:BoundField HeaderText="ID" DataField="ID" SortExpression="ID">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>

                             <asp:BoundField HeaderText="วันที่" DataField="DateTime" SortExpression="DateTime">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>

                          <%--  <asp:BoundField HeaderText="เรื่อง" DataField="Topic" SortExpression="Topic">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>--%>
                
                            <asp:TemplateField HeaderText="ชื่อทุน" SortExpression="Topic">
                                <ItemTemplate>
                                     <asp:HyperLink ID="selectLink" runat="server" 
                                         NavigateUrl='<%#"~/Page/MainRecord/View-News.aspx?id=" + Eval("Topic").ToString()%>' 
                                        Target="_Blank" Text='<%# Bind("Topic")%>' />
                                </ItemTemplate>
                           </asp:TemplateField>

                          <asp:BoundField HeaderText="จำนวนทุน" DataField="CountFund" SortExpression="CountFund">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>

                            <asp:BoundField HeaderText="จำนวนทุนคงเหลือ" DataField="FunReal" SortExpression="FunReal">
                                <HeaderStyle HorizontalAlign="Center" ForeColor="red"/>
                                <ItemStyle HorizontalAlign="Left" ForeColor="red" />
                            </asp:BoundField>

                             <asp:BoundField HeaderText="จำนวนเงินต่อทุน" DataField="MuneyPerFund" SortExpression="MuneyPerFund">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>

                           <asp:BoundField HeaderText="วันที่เริ่มให้ทุน" DataField="Start_date" SortExpression="Start_date">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                                 
                            <asp:BoundField HeaderText="วันที่สิ้นสุดให้ทุน" DataField="End_date" SortExpression="End_date">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                                                                 
                            <asp:BoundField HeaderText="จำนวนวันคงเหลือ" DataField="Endday" SortExpression="Endday">
                                <HeaderStyle HorizontalAlign="Center" ForeColor="red"/>
                                <ItemStyle HorizontalAlign="Left" ForeColor="red"/>
                            </asp:BoundField>
                
                             <asp:BoundField  HeaderText="แหล่งทุน" DataField="From_Fund" SortExpression="From_Fund">
                                <HeaderStyle HorizontalAlign="Center"  />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>

                             <asp:BoundField HeaderText="ประเภททุน" DataField="Type_Fund" SortExpression="Type_Fund">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>

                            <asp:BoundField HeaderText="อ่าน" DataField="Hits" SortExpression="Hits">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>

                        </Columns>
                        <EmptyDataTemplate>
                            ไม่พบข้อมูล
                        </EmptyDataTemplate>
                        <PagerSettings Position="TopAndBottom" />
                 </asp:GridView>
               <div class ="text-center"> 
                      <i>หน้าที่ <%=gvDataTab3.PageIndex + 1%> จาก <%=gvDataTab3.PageCount%> </i>
                    </div>
              </div>
             </div> 
         </div>
     <div id="Tab5"  class="tab-pane fade">
            <h3 class ="text-center ">ทุนรัฐบาล (รอกำหนดกรรมการพิจารณาทุน)</h3>
             <button class="btn btn-info btn-lg" data-target="#myModal" data-toggle="modal" type="button">ค้นหา</button>
              <br />  
              <br />   
                 <div class="panel panel-primary">
                    <div class="panel-heading">
                    <h1 class="panel-title">รายการ</h1 >
                 </div>
                <div class="table-responsive">
                <div class ="text-center"> 
                 <i>หน้าที่ <%=gvDataTab4.PageIndex + 1%> จาก <%=gvDataTab4.PageCount%> </i>
           </div>
               <asp:GridView ID="gvDataTab4" runat="server" CssClass="table table-bordered table-hover"
                        AllowPaging="true" AllowSorting="true" PageSize="30" AutoGenerateColumns="false" ShowFooter="false">
                        <Columns>
                            <asp:TemplateField HeaderText="ลำดับ">
                                  <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                  </ItemTemplate>
                            </asp:TemplateField>                 

                            <asp:BoundField HeaderText="ID" DataField="ID" SortExpression="ID">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>

                             <asp:BoundField HeaderText="วันที่" DataField="DateTime" SortExpression="DateTime">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>

                          <%--  <asp:BoundField HeaderText="เรื่อง" DataField="Topic" SortExpression="Topic">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>--%>
                
                            <asp:TemplateField HeaderText="ชื่อทุน" SortExpression="Topic">
                                <ItemTemplate>
                                     <asp:HyperLink ID="selectLink" runat="server" 
                                         NavigateUrl='<%#"~/Page/MainRecord/View-News.aspx?id=" + Eval("Topic").ToString()%>' 
                                        Target="_Blank" Text='<%# Bind("Topic")%>' />
                                </ItemTemplate>
                           </asp:TemplateField>

                          <asp:BoundField HeaderText="จำนวนทุน" DataField="CountFund" SortExpression="CountFund">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>

                            <asp:BoundField HeaderText="จำนวนทุนคงเหลือ" DataField="FunReal" SortExpression="FunReal">
                                <HeaderStyle HorizontalAlign="Center" ForeColor="red"/>
                                <ItemStyle HorizontalAlign="Left" ForeColor="red" />
                            </asp:BoundField>

                             <asp:BoundField HeaderText="จำนวนเงินต่อทุน" DataField="MuneyPerFund" SortExpression="MuneyPerFund">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>

                           <asp:BoundField HeaderText="วันที่เริ่มให้ทุน" DataField="Start_date" SortExpression="Start_date">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                                 
                            <asp:BoundField HeaderText="วันที่สิ้นสุดให้ทุน" DataField="End_date" SortExpression="End_date">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                                                                 
                            <asp:BoundField HeaderText="จำนวนวันคงเหลือ" DataField="Endday" SortExpression="Endday">
                                <HeaderStyle HorizontalAlign="Center" ForeColor="red"/>
                                <ItemStyle HorizontalAlign="Left" ForeColor="red"/>
                            </asp:BoundField>
                
                             <asp:BoundField  HeaderText="แหล่งทุน" DataField="From_Fund" SortExpression="From_Fund">
                                <HeaderStyle HorizontalAlign="Center"  />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>

                             <asp:BoundField HeaderText="ประเภททุน" DataField="Type_Fund" SortExpression="Type_Fund">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>

                            <asp:BoundField HeaderText="อ่าน" DataField="Hits" SortExpression="Hits">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>

                        </Columns>
                        <EmptyDataTemplate>
                            ไม่พบข้อมูล
                        </EmptyDataTemplate>
                        <PagerSettings Position="TopAndBottom" />
                 </asp:GridView>
               <div class ="text-center"> 
                      <i>หน้าที่ <%=gvDataTab4.PageIndex + 1%> จาก <%=gvDataTab4.PageCount%> </i>
                    </div>
              </div>
             </div> 
         </div>
     <div id="Tab6"  class="tab-pane fade">
            <h3 class ="text-center ">ทุนเอกชน (รอกำหนดกรรมการพิจารณาทุน)</h3>
             <button class="btn btn-info btn-lg" data-target="#myModal" data-toggle="modal" type="button">ค้นหา</button>
              <br />  
              <br />   
                 <div class="panel panel-primary">
                    <div class="panel-heading">
                    <h1 class="panel-title">รายการ</h1 >
                 </div>
                <div class="table-responsive">
                <div class ="text-center"> 
                 <i>หน้าที่ <%=gvDataTab4.PageIndex + 1%> จาก <%=gvDataTab4.PageCount%> </i>
           </div>
               <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-hover"
                        AllowPaging="true" AllowSorting="true" PageSize="30" AutoGenerateColumns="false" ShowFooter="false">
                        <Columns>
                            <asp:TemplateField HeaderText="ลำดับ">
                                  <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                  </ItemTemplate>
                            </asp:TemplateField>                 

                            <asp:BoundField HeaderText="ID" DataField="ID" SortExpression="ID">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>

                             <asp:BoundField HeaderText="วันที่" DataField="DateTime" SortExpression="DateTime">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>

                          <%--  <asp:BoundField HeaderText="เรื่อง" DataField="Topic" SortExpression="Topic">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>--%>
                
                            <asp:TemplateField HeaderText="ชื่อทุน" SortExpression="Topic">
                                <ItemTemplate>
                                     <asp:HyperLink ID="selectLink" runat="server" 
                                         NavigateUrl='<%#"~/Page/MainRecord/View-News.aspx?id=" + Eval("Topic").ToString()%>' 
                                        Target="_Blank" Text='<%# Bind("Topic")%>' />
                                </ItemTemplate>
                           </asp:TemplateField>

                          <asp:BoundField HeaderText="จำนวนทุน" DataField="CountFund" SortExpression="CountFund">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>

                            <asp:BoundField HeaderText="จำนวนทุนคงเหลือ" DataField="FunReal" SortExpression="FunReal">
                                <HeaderStyle HorizontalAlign="Center" ForeColor="red"/>
                                <ItemStyle HorizontalAlign="Left" ForeColor="red" />
                            </asp:BoundField>

                             <asp:BoundField HeaderText="จำนวนเงินต่อทุน" DataField="MuneyPerFund" SortExpression="MuneyPerFund">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>

                           <asp:BoundField HeaderText="วันที่เริ่มให้ทุน" DataField="Start_date" SortExpression="Start_date">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                                 
                            <asp:BoundField HeaderText="วันที่สิ้นสุดให้ทุน" DataField="End_date" SortExpression="End_date">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                                                                 
                            <asp:BoundField HeaderText="จำนวนวันคงเหลือ" DataField="Endday" SortExpression="Endday">
                                <HeaderStyle HorizontalAlign="Center" ForeColor="red"/>
                                <ItemStyle HorizontalAlign="Left" ForeColor="red"/>
                            </asp:BoundField>
                
                             <asp:BoundField  HeaderText="แหล่งทุน" DataField="From_Fund" SortExpression="From_Fund">
                                <HeaderStyle HorizontalAlign="Center"  />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>

                             <asp:BoundField HeaderText="ประเภททุน" DataField="Type_Fund" SortExpression="Type_Fund">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>

                            <asp:BoundField HeaderText="อ่าน" DataField="Hits" SortExpression="Hits">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>

                        </Columns>
                        <EmptyDataTemplate>
                            ไม่พบข้อมูล
                        </EmptyDataTemplate>
                        <PagerSettings Position="TopAndBottom" />
                 </asp:GridView>
               <div class ="text-center"> 
                      <i>หน้าที่ <%=gvDataTab4.PageIndex + 1%> จาก <%=gvDataTab4.PageCount%> </i>
                    </div>
              </div>
             </div> 
         </div>
     <div id="Tab7"  class="tab-pane fade">
            <h3 class ="text-center ">จริยธรรม (EC) (รอกำหนดกรรมการพิจารณาจริยธรรม (EC)) </h3>
             <button class="btn btn-info btn-lg" data-target="#myModal" data-toggle="modal" type="button">ค้นหา</button>
              <br />  
              <br />   
                 <div class="panel panel-primary">
                    <div class="panel-heading">
                    <h1 class="panel-title">รายการ</h1 >
                 </div>
                <div class="table-responsive">
                <div class ="text-center"> 
                 <i>หน้าที่ <%=gvDataTab4.PageIndex + 1%> จาก <%=gvDataTab4.PageCount%> </i>
           </div>
               <asp:GridView ID="GridView2" runat="server" CssClass="table table-bordered table-hover"
                        AllowPaging="true" AllowSorting="true" PageSize="30" AutoGenerateColumns="false" ShowFooter="false">
                        <Columns>
                            <asp:TemplateField HeaderText="ลำดับ">
                                  <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                  </ItemTemplate>
                            </asp:TemplateField>                 

                            <asp:BoundField HeaderText="ID" DataField="ID" SortExpression="ID">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>

                             <asp:BoundField HeaderText="วันที่" DataField="DateTime" SortExpression="DateTime">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>

                          <%--  <asp:BoundField HeaderText="เรื่อง" DataField="Topic" SortExpression="Topic">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>--%>
                
                            <asp:TemplateField HeaderText="ชื่อทุน" SortExpression="Topic">
                                <ItemTemplate>
                                     <asp:HyperLink ID="selectLink" runat="server" 
                                         NavigateUrl='<%#"~/Page/MainRecord/View-News.aspx?id=" + Eval("Topic").ToString()%>' 
                                        Target="_Blank" Text='<%# Bind("Topic")%>' />
                                </ItemTemplate>
                           </asp:TemplateField>

                          <asp:BoundField HeaderText="จำนวนทุน" DataField="CountFund" SortExpression="CountFund">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>

                            <asp:BoundField HeaderText="จำนวนทุนคงเหลือ" DataField="FunReal" SortExpression="FunReal">
                                <HeaderStyle HorizontalAlign="Center" ForeColor="red"/>
                                <ItemStyle HorizontalAlign="Left" ForeColor="red" />
                            </asp:BoundField>

                             <asp:BoundField HeaderText="จำนวนเงินต่อทุน" DataField="MuneyPerFund" SortExpression="MuneyPerFund">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>

                           <asp:BoundField HeaderText="วันที่เริ่มให้ทุน" DataField="Start_date" SortExpression="Start_date">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                                 
                            <asp:BoundField HeaderText="วันที่สิ้นสุดให้ทุน" DataField="End_date" SortExpression="End_date">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                                                                 
                            <asp:BoundField HeaderText="จำนวนวันคงเหลือ" DataField="Endday" SortExpression="Endday">
                                <HeaderStyle HorizontalAlign="Center" ForeColor="red"/>
                                <ItemStyle HorizontalAlign="Left" ForeColor="red"/>
                            </asp:BoundField>
                
                             <asp:BoundField  HeaderText="แหล่งทุน" DataField="From_Fund" SortExpression="From_Fund">
                                <HeaderStyle HorizontalAlign="Center"  />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>

                             <asp:BoundField HeaderText="ประเภททุน" DataField="Type_Fund" SortExpression="Type_Fund">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>

                            <asp:BoundField HeaderText="อ่าน" DataField="Hits" SortExpression="Hits">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>

                        </Columns>
                        <EmptyDataTemplate>
                            ไม่พบข้อมูล
                        </EmptyDataTemplate>
                        <PagerSettings Position="TopAndBottom" />
                 </asp:GridView>
               <div class ="text-center"> 
                      <i>หน้าที่ <%=gvDataTab4.PageIndex + 1%> จาก <%=gvDataTab4.PageCount%> </i>
                    </div>
              </div>
             </div> 
         </div>
  </div>

<br />  
</div>
</asp:Content>
