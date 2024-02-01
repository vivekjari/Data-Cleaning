-- data cleaning on sql queries --
select * from Project.NashvilleHousing;


-- change date format --

ALTER TABLE Project.NashvilleHousing 
modify `SaleDate` date;

-- populate property address data --

select *
from Project.NashvilleHousing
order by ParcelID;
-- where PropertyAddress = " " --

select a.ParcelID,a.PropertyAddress,b.ParcelID,b.PropertyAddress, ifnull(b.PropertyAddress,a.PropertyAddress)
from Project.NashvilleHousing a
join Project.NashvilleHousing b
 on a.ParcelID = b.ParcelID
 and a.UniqueID <> b.UniqueID
 where a.PropertyAddress = " ";

update a
set PropertyAddress = ifnull(b.PropertyAddress,a.PropertyAddress)
from Project.NashvilleHousing a
join Project.NashvilleHousing b
 on a.ParcelID = b.ParcelID
 and a.UniqueID <> b.UniqueID
 where a.PropertyAddress = " ";
 
 -- breaking out address into individual columns (Address,City, State)
select PropertyAddress 
from Project.NashvilleHousing;
 
select 
substring(PropertyAddress,1,LOCATE(',',PropertyAddress)-1) as Address,
substring(PropertyAddress,LOCATE(',',PropertyAddress)+1,length(Propertyaddress)) as Address
from Project.NashvilleHousing;
 
 Alter table Project.NashvilleHousing
 add Propertyaddresssplit Nvarchar(255);
 
update Project.NashvilleHousing
set Propertyaddresssplit = substring(PropertyAddress,1,LOCATE(',',PropertyAddress)-1);
 
Alter table Project.NashvilleHousing
add Propertysplitcity Nvarchar(255);

update Project.NashvilleHousing
set Propertysplitcity = substring(PropertyAddress,LOCATE(',',PropertyAddress)+1,length(Propertyaddress));

select OwnerAddress
from Project.NashvilleHousing;


select 
SUBSTRING_INDEX(OwnerAddress,',',1 ) as Address,
SUBSTRING_INDEX(SUBSTRING_index(OwnerAddress,',',-2),',',1) as CITY,
SUBSTRING_INDEX(OwnerAddress,',',-1 ) as STATE
from Project.NashvilleHousing;

 Alter table Project.NashvilleHousing
 add Owneraddresssplit Nvarchar(255);
 
update Project.NashvilleHousing
set Owneraddresssplit = SUBSTRING_INDEX(OwnerAddress,',',1 );
 
Alter table Project.NashvilleHousing
add Ownersplitcity Nvarchar(255);

update Project.NashvilleHousing
set Ownersplitcity = SUBSTRING_INDEX(SUBSTRING_index(OwnerAddress,',',-2),',',1);

Alter table Project.NashvilleHousing
add Ownersplitstate Nvarchar(255);

update Project.NashvilleHousing
set Ownersplitstate = SUBSTRING_INDEX(OwnerAddress,',',-1 );

-- change Y and N to YES and No in "sold as vacant" field --

select distinct(SoldAsVacant),count(SoldAsVacant)
from Project.NashvilleHousing
group by SoldAsVacant
order by 2;

select   SoldAsVacant
from Project.NashvilleHousing
where SoldAsVacant = 'Y';

select SoldAsVacant
from Project.NashvilleHousing
where SoldAsVacant = 'N';

select SoldAsVacant,
case when SoldAsVacant = 'Y' then 'Yes'
	 when SoldAsVacant = 'N' then 'No'
     else SoldAsVacant
     END
from Project.NashvilleHousing;


update NashvilleHousing
set SoldAsVacant = case when SoldAsVacant = 'Y' then 'Yes'
	 when SoldAsVacant = 'N' then 'No'
     else SoldAsVacant
     END;
     

-- remove duplicates--

delete
row_number()  over (partition by ParcelID,PropertyAddress,SalePrice,SaleDate,LegalRefrence order by UniqueID ) AS row_num
from Project.NashvilleHousing 
where row_num > 1 ;


-- delete unsed columns--

select * from Project.NashvilleHousing;
 
 alter table Project.NashvilleHousing
drop column OwnerAddress, 
drop column TaxDistrict,
drop column PropertyAddress










 




