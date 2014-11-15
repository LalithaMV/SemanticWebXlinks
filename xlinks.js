var dic = new buckets.MultiDictionary();


/*This function is just for checking the working of populated attributes*/
function checkBucket()
{
	//alert("checkBucket");
	//alert(getAttribute('one','id'));
	//alert(getAttribute('three','attr1'));
	//key = dic.keys();
	//alert("Check bucket : " +key);
	for(var i = 0;i<key.length;i++)
	{
		//alert("inseide for");
		
		c = (dic.get(key[i]));
		//alert(c);
		for(var j=0;j<c.length;j++)
		{

			d = (c[j].keys());

			//alert(d+":"+c[j].get(d[0]));
		}
	}
}

/*Use this function to get a particular attribute. idval - the id of the element provided in the xml file, name - Name of the attribute required*/
function getAttribute(idval,name)
{
	key=dic.keys();
	//alert("Id of element : "+idval);
	//alert("Attribute Name : "+name);
	c=dic.get(idval);
	for(var j=0;j<c.length;j++)
	{

		d = (c[j].keys());
		//alert("array - "+d);
		if(d[0]==name)
			return c[j].get(d[0])		
			//alert("From get function " +d+":"+c[j].get(d[0]));
	}
	return 0;

}

/*Populate attributes. Function used in the xsl file*/
function populateAttr(idval,name,val)
{
	var a = idval;
	var b = new buckets.Dictionary();

	b.set(name,val);
	dic.set(a,b);
	//alert(dic.values());
	key = dic.keys();
	//alert("Populating - keys"+key);
	for(var i = 0;i<key.length;i++)
	{
		//alert(key[i]);
		c = (dic.get(key[i]));
		//alert("Value "+c)
		for(var j=0;j<c.length;j++)
		{
			d = c[j];
		}
	}
	//alert(a);
	//alert(name);
	//alert(val);
}

function loadXMLDoc(dname)
{
if (window.XMLHttpRequest)
  {
  xhttp=new XMLHttpRequest();
  }
else
  {
  xhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xhttp.open("GET",dname,false);
xhttp.send("");
return xhttp.responseXML;
}


function displayResult(a,b)
{
xml=loadXMLDoc(a);
xsl=loadXMLDoc(b);
// code for IE
if (window.ActiveXObject)
  {
  ex=xml.transformNode(xsl);
  document.getElementById("example").innerHTML=ex;
  }
// code for Mozilla, Firefox, Opera, etc.
else if (document.implementation && document.implementation.createDocument)
  {
  xsltProcessor=new XSLTProcessor();
  xsltProcessor.importStylesheet(xsl);
  resultDocument = xsltProcessor.transformToFragment(xml,document);
  document.getElementById("example").appendChild(resultDocument);
  //checkBucket();
  }
}


function testClick(vari)
{
	Extended(vari);
}

/*Function for simple links*/
function Simple(vari)
{
	window.open(vari);	
}


/*function for extended links*/
function Extended(vari)
{
	var n=vari.split(",");
	n.pop();
	for (var i=0;i<n.length;i++)
	{
		window.open(n[i]);
	}
		
}