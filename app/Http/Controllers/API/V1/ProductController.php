<?php

namespace App\Http\Controllers\API\V1;

use App\Models\Product;
use Illuminate\Http\Request;

class ProductController
{
    public function index(Request $request)
    {
        $perPage = $request->input('per_page', 15);
        $products = Product::paginate($perPage);

        return response()->json($products);
    }
}
