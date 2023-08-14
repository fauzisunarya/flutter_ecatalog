import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecatalog/bloc/add_product/add_product_bloc.dart';
import 'package:flutter_ecatalog/bloc/cubit_update_product/update_product_cubit.dart';
import 'package:flutter_ecatalog/bloc/login/login_bloc.dart';
import 'package:flutter_ecatalog/bloc/product/product_bloc.dart';
import 'package:flutter_ecatalog/bloc/register/register_bloc.dart';
import 'package:flutter_ecatalog/bloc/update_product/update_product_bloc.dart';
import 'package:flutter_ecatalog/data/datasource/atuh_datasource.dart';
import 'package:flutter_ecatalog/data/datasource/product_datasource.dart';
import 'package:flutter_ecatalog/presentation/login_page.dart';
import 'package:flutter_ecatalog/presentation/register_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegisterBloc(AuthDataSource()),
        ),
        BlocProvider(
          create: (context) => LoginBloc(AuthDataSource()),
        ),
        BlocProvider(
          create: (context) => ProductBloc(ProductDataSource()),
        ),
        BlocProvider(
          create: (context) => AddProductBloc(ProductDataSource()),
        ),
        BlocProvider(
          create: (context) => UpdateProductBloc(ProductDataSource()),
        ),
        BlocProvider(
          create: (context) => UpdateProductCubit(ProductDataSource()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const LoginPage(),
      ),
    );
  }
}
