import 'package:ecommerce/models/shop.dart';
import 'package:ecommerce/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as location;
import 'package:geocoding/geocoding.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  late GoogleMapController mapController;
  LatLng _center = LatLng(22.1566, -100.9855); //Iniciar en San Luis Potosi, SLP
  location.Location _location = location.Location(); //Para guardar dirección

  // Manejar creación de mapa
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  // Function to handle user location update
  Future<void> _onUserLocationUpdate() async {
    try {
      location.LocationData locationData = await _location.getLocation();

      double latitude = locationData.latitude!;
      double longitude = locationData.longitude!;

      // Perform reverse geocoding to get address information
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);

      if (placemarks.isNotEmpty) {
        Placemark placemark = placemarks[0];
        String street = placemark.street ?? 'N/A';

        print('User is located on $street');
        // You can use the 'street' variable as needed in your application
        //shippingAdress = street; //actualizar direccion de envio
      }
    } catch (e) {
      print('Error getting user location: $e');
    }
  }

  // Function to handle user input for custom location
  void _onMapTap(LatLng tappedPoint) {
    setState(() {
      _center = tappedPoint;
    });
  }

  @override
  Widget build(BuildContext context) {
    //Obtener usuario
    late User user = context.watch<Shop>().user;
    //Obtener shop para calcular precio de productos
    late Shop shop = context.watch<Shop>();

    //Calcular precio de productos
    double calcularPrecio() {
      double total = 0.0;
      for (int i = 0; i < shop.cart.length; i++) {
        total += double.parse(shop.cart[i].price);
      }
      return total;
    }

    // Datos predefinidos de mock
    String debitCardNumber = '1234 5678 9012 3456';
    String shippingAddress = 'Pedro Moreno 211, San Luis Potosi';

    String? username = user.name; //Rescatar nombre de usuario
    double paymentAmount = calcularPrecio(); //calcular precio total de carrito

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Pagar'),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Nombre: $username',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              Text(
                'Numero de tarjeta: $debitCardNumber',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              Text(
                'Cantidad a pagar: $paymentAmount',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              Text(
                'Dirección de envio: $shippingAddress',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              AspectRatio(
                aspectRatio: 1,
                child: GoogleMap(
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: _center,
                    zoom: 11.0,
                  ),
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                  onCameraMove: (CameraPosition position) {
                    // Handle camera movement if needed
                  },
                  onCameraIdle: () {
                    // Handle camera idle event if needed
                    _onUserLocationUpdate();
                  },
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  // Logica para "procesar pago" y subir pedido a firebase
                },
                child: const Text('Hacer pago'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
