function validateForm(event) {
    event.preventDefault(); // Prevent form submission

    const form = event.target.form || event.target.closest('form');
    let valid = true;

    const productName = form['pname'].value;
    if (productName.length < 1 || productName.length > 255) {
        alert('Product Name must be between 1 and 255 characters.');
        valid = false;
    }

    const description = form['Description'].value;
    if (description.length < 1 || description.length > 1000) {
        alert('Description must be between 1 and 1000 characters.');
        valid = false;
    }

    const originalPrice = parseFloat(form['OriginalPrice'].value);
    if (isNaN(originalPrice) || originalPrice <= 0 || originalPrice > 99999999) {
        alert('Original Price must be a numeric value between 1 and 99999999.');
        valid = false;
    }

    const sellPrice = parseFloat(form['SellPrice'].value);
    if (isNaN(sellPrice) || sellPrice <= 0 || sellPrice > originalPrice || sellPrice > 99999999) {
        alert('Sell Price must be a numeric value between 1 and the Original Price, and not more than 99999999.');
        valid = false;
    }

    const sellPercent = parseFloat(form['SalePercent'].value);
    if (isNaN(sellPercent) || sellPercent < 0 || sellPercent > 100) {
        alert('Sale Percent must be a numeric value between 0 and 100.');
        valid = false;
    }

    const amount = parseInt(form['Amount'].value);
    if (isNaN(amount) || amount < 0 || amount > 9999) {
        alert('Amount must be a numeric value between 0 and 9999.');
        valid = false;
    }

    const statusID = form['sttID'].value;
    if (!statusID.match(/^\d+$/)) {
        alert('StatusID must be a valid numeric ID.');
        valid = false;
    }

    const brandID = form['brandID'].value;
    if (!brandID.match(/^\d+$/)) {
        alert('BrandID must be a valid numeric ID.');
        valid = false;
    }

    const height = parseFloat(form['height'].value);
    if (isNaN(height) || height <= 0 || height > 999) {
        alert('Height must be a numeric value between 1 and 999.');
        valid = false;
    }

    const width = parseFloat(form['width'].value);
    if (isNaN(width) || width <= 0 || width > 999) {
        alert('Width must be a numeric value between 1 and 999.');
        valid = false;
    }

    const weight = parseFloat(form['weight'].value);
    if (isNaN(weight) || weight <= 0 || weight > 999) {
        alert('Weight must be a numeric value between 1 and 999.');
        valid = false;
    }

//        const image = form['resources/img/product'];
//        if (image) {
//            const validImageTypes = ['resources/img/product/jpg', 'resources/img/product/png'];
//            if (!validImageTypes.includes(image.type)) {
//                alert('Image must be a .jpg or .png file.');
//                valid = false;
//            } else if (image.size > 5242880) {
//                alert('Image size must be less than or equal to 5MB.');
//                valid = false;
//            }
//        }
//
    const category = form['Category'].value;
    if (!category.match(/^\d+$/)) {
        alert('Category must be a valid ID from the database.');
        valid = false;
    }

    return valid;
}


