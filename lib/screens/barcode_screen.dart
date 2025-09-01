import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../utils/size_config.dart';
import '../components/qr_code_overlay.dart';

class BarcodeScreen extends StatefulWidget {
  const BarcodeScreen({super.key});

  @override
  State<BarcodeScreen> createState() => _BarcodeScreenState();
}

class _BarcodeScreenState extends State<BarcodeScreen> {
  MobileScannerController cameraController = MobileScannerController(facing: CameraFacing.external);

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MobileScanner(
            controller: cameraController,
            onDetect: (capture) {
              print(capture.barcodes.first.rawValue);
            },
          ),
          QRScannerOverlay(overlayColour: Colors.black.withValues(alpha: 0.5)),
          Positioned(
            top: SizeConfig.getProportionateScreenHeight(40),

            child: Row(
              children: [
                SizedBox(width: SizeConfig.getProportionateScreenWidth(20)),
                Container(
                  width: SizeConfig.getProportionateScreenWidth(45),
                  height: SizeConfig.getProportionateScreenWidth(45),
                  decoration: BoxDecoration(
                    color: Color(0xFF296E48).withValues(alpha: 0.3),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () => cameraController.toggleTorch(),
                    icon: ValueListenableBuilder(
                      valueListenable: cameraController,
                      builder: (context, state, child) {
                        switch (state.torchState) {
                          case TorchState.on:
                            return Icon(
                              Icons.flash_off,
                              color: Colors.white,
                              size: SizeConfig.getProportionateScreenWidth(25),
                            );
                          case TorchState.off:
                            return Icon(
                              Icons.flash_on,
                              color: Colors.white,
                              size: SizeConfig.getProportionateScreenWidth(25),
                            );
                          default:
                            return const SizedBox.shrink();
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(width: SizeConfig.screenWidth * 0.65),
                Container(
                  width: SizeConfig.getProportionateScreenWidth(45),
                  height: SizeConfig.getProportionateScreenWidth(45),
                  decoration: BoxDecoration(
                    color: Color(0xFF296E48).withValues(alpha: 0.3),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(
                      Icons.close,
                      color: Colors.white,
                      size: SizeConfig.getProportionateScreenWidth(25),
                    ),
                  ),
                ),
                SizedBox(width: SizeConfig.getProportionateScreenWidth(20)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
