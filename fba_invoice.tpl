<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
<title>FBA Invoice</title>
<base href="<?php echo $base; ?>" />
<link rel="stylesheet" type="text/css" href="view/stylesheet/invoice.css" />
</head>
<body>
<?php if (empty($orders)) echo '<span style="color:#EC1208; font-size: 20px; text-align:center;">Please select order or orders. Thank you</span>' ;?>
<?php foreach ($orders as $order) { ?>
<div style="page-break-after: always;">
    
  <!--h1 style="text-align: left;"><img src="https://www.healthyworld.in/image/data/logo-healthyworld.png" ></h1-->
  <table class="store">
    <tr><b>GST No.:</b>27AADCH3292H1ZI<center><span style="font-size: 20px; text-align:center; text-decoration: underline;">Delivery Challan</span></center><b>Telephone:</b> +918767120120 <br/>
    <b>FSSAI:</b> <?php echo $this->config->get('config_fssai_number'); ?><br />
      <center><span style="font-size: 25px; text-align:center; ">HW Wellness Solutions Private Limited</span></center><br />
       <center><b>S.No 254, Tirumalla Industry Estate, Phase 2 Road, Hinjawadi, Pune, Maharashtra, 411057</b></center>
    </tr>
  </table>
  <table class="address">
    <tr class="heading">
      <td width="50%"><b><?php echo $text_to; ?></b></td>
      <td width="05%"></td>

      
    </tr>
    <tr>
      <td width: 20%;><?php echo $order['shipping_address']; ?><br/>
      
        <?php echo $order['email']; ?><br/>
        <?php echo $order['telephone']; ?></td>
        <br/><br/>
        <?php echo $order['zone']; ?>
        <?php echo $order['zone1']; ?>
        
      <td width: 30%;>
           <table>
      	<tr>
      		<td><b>Invoice date:</b></td>
      		<td><?php echo $order['date_added']; ?></td>
      	</tr>
      	<tr>       <td><b>Invoice no:</b></td> 
      		<td><?php echo $order['order_id']; ?></td>
      	</tr>
      	<tr> 
      		<td>GSTIN:</td> 
      		<td><?php echo $order['payment_tax_id']; ?></td>
      	</tr>
      	<tr> 
      		<td><b>Total No. of Boxes:</b>
      			<td><?php echo $order['box_count']; ?></td>
      		</tr>
      		<tr> 
      			<td><b>Total No. of units:</b></td>
      			<td><?php echo $order['unit_count']; ?></td>
      		</tr>
      		<tr> 
      			<td><b>Appointment ID:</b></td> 
      			<td><?php echo $order['appointment_id']; ?></td>
      		</tr>
      		<tr> 
      			<td><b>Delivery Date:</b></td> 
      			<td><?php echo $order['delivery_date']; ?></td>
      		</tr>
      		<tr> 
      			<td><b>Expiry Date:</b></td> 
      			<td><?php echo $order['expiry_date']; ?></td>
      		</tr>
      		<tr> 
      			<td><b>Shipment ID:</b></td>
      			<td><?php echo $order['shipment_id']; ?></td>
      		</tr>
      		<tr> 
      			<td><b>Name:</b></td> 
      			<td><?php echo $order['warehouse']; ?></td>
      		</tr>
      		<tr> 
      			<td><b>Plan ID:</b></td>
      			<td><?php echo $order['plan_id']; ?></td>
      		</tr>
      	</table>
          
      </td>
    </tr>
  </table>
      <table class="product">
    <tr class="heading">
         <td><b>ASIN</b></td>
          <td><b>Product ID</b></td>
      <td><b><?php echo $column_product; ?></b></td>
      <td><b>HSN</b></td>
      <td align="right"><b>MRP</b></td>
      <td align="right"><b><?php echo $column_quantity; ?></b></td>
      <td align="right"><b>Rate</b></td>
      <td align="right"><b>Gross Amount</b></td>
      <td align="right"><b>GST %</b></td>
      <td align="right"><b>GST Amount</b></td> 
      <!--td align="right"><b>IGST</b></td>
      <td align="right"><b>CGST</b></td-->
      <td align="right"><b><?php echo $column_total; ?></b></td>
    </tr>
    <?php foreach ($order['product'] as $product) { ?>
    <tr>
        <td><?php echo $product['amazon_asin']; ?></td>
              <td><?php echo $product['id']; ?></td>
      <td><?php echo $product['name']; ?>
        <?php foreach ($product['option'] as $option) { ?>
        <br />
        &nbsp;<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
        <?php } ?></td>
      <td><?php echo $product['model']; ?></td>
       <td align="right"><?php echo $product['mrp2']; ?></td>
       <td align="right"><?php echo round($product['quantity']); ?></td>
      <td align="right"><?php echo $product['price']; ?></td>
      <td align="right"><?php echo ($product['price'] * $product['quantity']); ?></td>
      <td align="right">
     <?php
         
        if ($product['gst2'] == "12") {
            echo "12%";
        } elseif ($product['gst2'] == "11") {
            echo "18%";
        } elseif ($product['gst2'] == "13") {
            echo "5%";
        } else {
            echo "28%";
        }
        ?> </td>
 
      <td align="right"><?php echo ($product['tax']); ?></td>
      <!--td align="right"><?php echo ($product['tax']); ?></td>
      <td align="right"><?php echo ($product['tax'])/2; ?></td-->
      <td align="right"><?php echo (($product['price'] * $product['quantity'] +$product['tax'])); ?></td>
    </tr>
    <?php } ?>
    <tr>
  <td align="right" colspan="5"><b>Total Quantity:</b></td>
  <td align="right" colspan="1"><?php 
    $total_qty = 0;
    foreach($order['product'] as $product) {
      $total_qty += $product['quantity'];
    }
    echo $total_qty."   " . "Units" ;
  ?></td>
  <td colspan="7"> </td>
</tr>
    <tr>
  <td align="right" colspan="5"><b>Total Weight:</b></td>
  <td align="right" ><?php 
    $total_weight = 0;
    foreach($order['product'] as $product) {
      $total_weight += (($product['weight']*$product['quantity'])*1000);
    }
    if($total_weight<1000){
     echo $total_weight."  " . "Grams" ;
    }else{
   echo ($total_weight/1000)."  " . "Kg" ;
 }
 ?></td>
  <td colspan="7"> </td>
</tr>
    <?php foreach ($order['voucher'] as $voucher) { ?>
    <tr>
      <td align="left"><?php echo $voucher['description']; ?></td>
      <td align="left"></td>
      <td align="right">1</td>
      <td align="right"><?php echo $voucher['amount']; ?></td>
      <td align="right"><?php echo $voucher['amount']; ?></td>
    </tr>
    <?php } ?>
    <?php foreach ($order['total'] as $total) { ?>
    <tr>
      <td align="right" colspan="10"><b><?php echo $total['title']; ?>:</b></td>
      <td align="right"><?php echo $total['text']; ?></td>
    </tr>
    <?php } ?>
    <tr>
      <td align="right" style="border-right: 1px solid #CDDDDD;" colspan="11"><b>Indian Rupees <?php echo $order['amountinwords']; ?></b></td> 
    </tr>
  </table><br /><br />
  <table class="address">
    <tr class="heading">
      <td><b>Declaration</b></td>
    </tr>
       <tr>
       <td class="left">The goods are provided solely for job work and not for any other use.<br />
</td>
    </tr>
  </table><br /><br /><br />    <!--<center> <b>FORM E</b><br />
Form of Guarantee<br />
We hereby certify that the foods mentioned in this invoice are warranted to be of the nature and quality which these purports/purported to be.<br /><br /> </center>-->
 
 <img src="/image/data/invoice/stamp.jpg" style="width: 100px;height: 100px;"><br />
 <b>For HW Wellness Solutions Private Limited</b><br /><br /><br />
  <center>
 

    <b>This is computer generated document</b></center>
 </div>
 <?php } ?>

   
</body>
</html>