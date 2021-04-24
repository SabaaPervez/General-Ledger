var items = [
    { VN: "Transaction", VP: "TR123" }
];
                


$('#Save1').click(function(){
  var x2 = document.getElementById("Input2").value;
  var x = document.getElementById("Input1").value;

  if(x!="" && x2!="")
  {
      // console.log("hii");
      var table = document.getElementById("itemList");
      var row = table.insertRow(table.length);
      var cell1 = row.insertCell(0);
      var cell2 = row.insertCell(1);
      cell1.innerHTML = x;
      cell2.innerHTML = x2;
      row.onclick= function()
  {
    rIndex = this.rowIndex;
    document.getElementById("Input1").value= this.cells[0].innerHTML
    document.getElementById("Input2").value= this.cells[1].innerHTML;
  }
  }
  document.getElementById("Input1").value="Enter Name";
  document.getElementById("Input2").value= "PV";

});

var table= document.getElementById("itemList"),rIndex;
for( var i=0; i < table.rows.length; i++)
{
  table.rows[i].onclick= function ()
  {
    rIndex = this.rowIndex;
    document.getElementById("Input1").value= this.cells[0].innerHTML
    document.getElementById("Input2").value= this.cells[1].innerHTML;
  }
}