$path = "\\192.168.201.14\Reporting\"
$lowes_default = "\\192.168.201.14\share\IT\Lowes Inventory Files\"
$qvc_default = "\\192.168.201.14\share\QVC\Inventory\"
$sears_default = "\\192.168.201.14\share\IT\Sears Inventory 2020\"
$walmart_default = "\\192.168.201.14\share\IT\Walmart Inventory Files\"

$target_path ="\\192.168.201.14\Ecommerce Department\Vendors\Acenda\Inventory\"
$amzseller_path = "\\192.168.201.14\Ecommerce Department\Inventory\Amazon Seller\"
$amzvendor_path = "\\192.168.201.14\Ecommerce Department\Inventory\Amazon Vendor- Drop Ship\"
$groupon_path = "\\192.168.201.14\Ecommerce Department\Inventory\Groupon\"
$lowes_path = "\\192.168.201.14\Ecommerce Department\Inventory\Lowes\"
$qvc_path = "\\192.168.201.14\Ecommerce Department\Inventory\QVC\"
$sears_path = "\\192.168.201.14\Ecommerce Department\Inventory\Sears-Kmart\"
$walmart_path = "\\192.168.201.14\Ecommerce Department\Inventory\Walmart\"
$zola_path = "\\192.168.201.14\Ecommerce Department\Inventory\Zola\"

get-childitem -path $path -Filter "Target inventory?*.csv" | 
    where-object { -not $_.PSIsContainer } | 
    sort-object -Property $_.CreationTime | 
    select-object -last 1 | 
    copy-item -Destination $target_path -Recurse -Force
	
get-childitem -path $path -Filter "Seller Central inventory?*.txt" | 
    where-object { -not $_.PSIsContainer } | 
    sort-object -Property $_.CreationTime | 
    select-object -last 1 | 
    copy-item -Destination $amzseller_path -Recurse -Force
	
get-childitem -path $path -Filter "Amazon inventory?*.csv" | 
    where-object { -not $_.PSIsContainer } | 
    sort-object -Property $_.CreationTime | 
    select-object -last 1 | 
    copy-item -Destination $amzvendor_path -Recurse -Force
	
get-childitem -path $path -Filter "GROUPON_INVENTORY_?*.csv" | 
    where-object { -not $_.PSIsContainer } | 
    sort-object -Property $_.CreationTime | 
    select-object -last 1 | 
    copy-item -Destination $groupon_path -Recurse -Force
	
get-childitem -path $lowes_default -Filter "CommerceHub_inventory?*.xls" | 
    where-object { -not $_.PSIsContainer } | 
    sort-object -Property $_.CreationTime | 
    select-object -last 1 | 
    copy-item -Destination $lowes_path -Recurse -Force
	
get-childitem -path $qvc_default -Filter "FABQVCINVENTORY?*.txt" | 
    where-object { -not $_.PSIsContainer } | 
    sort-object -Property $_.CreationTime | 
    select-object -last 1 | 
    copy-item -Destination $qvc_path -Recurse -Force
	
get-childitem -path $sears_default -Filter "SearsInventory?*.xlsx" | 
    where-object { -not $_.PSIsContainer } | 
    sort-object -Property $_.CreationTime | 
    select-object -last 1 | 
    copy-item -Destination $sears_path -Recurse -Force
	
get-childitem -path $walmart_default -Filter "FAB-Walmart-Inventory2021?*.xlsx" | 
    where-object { -not $_.PSIsContainer } | 
    sort-object -Property $_.CreationTime | 
    select-object -last 1 | 
    copy-item -Destination $walmart_path -Recurse -Force
	
get-childitem -path $path -Filter "ZOLA_Inventory_?*.csv" | 
    where-object { -not $_.PSIsContainer } | 
    sort-object -Property $_.CreationTime | 
    select-object -last 1 | 
    copy-item -Destination $zola_path -Recurse -Force