
SELECT
    Name,
    Price,
    CASE
        WHEN Price < 10 THEN 'Cheap'
        WHEN Price >= 10 AND Price <= 50 THEN 'Moderate'
        ELSE 'Expensive'
        END AS PriceCategory
FROM
    Products;


SELECT
    Name,
    Quantity,
    CASE
        WHEN Quantity = 0 THEN 'Out of Stock'
        ELSE 'In Stock'
        END AS StockStatus
FROM
    Products;


SELECT
    Name,
    Price,
    VendorName,
    CASE VendorName
        WHEN 'Pet Paradise' THEN Price * 0.9 -- 10% discount for VendorA
        WHEN 'Ready Tools' THEN Price * 0.85 -- 15% discount for VendorB
        ELSE Price
        END AS DiscountedPrice
FROM
    Products;


SELECT
    Name,
    Quantity,
    CASE
        WHEN Quantity = 0 THEN 'Currently unavailable'
        WHEN Quantity <= 5 THEN 'Limited stock available'
        ELSE 'Available in ample quantity'
        END AS StockDescription
FROM
    Products;


SELECT
    Name,
    Price,
    Quantity,
    CASE
        WHEN Quantity = 0 AND Price > 50 THEN 'High priced and out of stock'
        WHEN Quantity > 10 AND Price < 20 THEN 'Affordable and well-stocked'
        ELSE 'Varies'
        END AS ProductStatus
FROM
    Products;
