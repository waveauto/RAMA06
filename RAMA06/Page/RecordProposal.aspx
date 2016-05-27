<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MSP01.Master" CodeBehind="RecordProposal.aspx.vb" Inherits="RAMA06.RecordProposal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<h2>"XXXXXXXXXXXXXXXXXX"</h2>     
<div><button class="btn btn-info btn-lg" data-target="#myModal" data-toggle="modal" type="button">ค้นหค้นหา</button><a href="StepStaff.aspx">StepStaff.aspx</a> <a href="StepUser.aspx">StepUser.aspx</a></div> 
    <br />
    <br />
 <div class="panel panel-primary">
                    <div class="panel-heading">
                    <h1 class="panel-title">รายการ >
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
<div></div> 
<div></div> 
<div></div> 
<div></div> 


</asp:Content>
