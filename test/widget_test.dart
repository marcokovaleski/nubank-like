import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nubank_like/main.dart';

/// Testes de Widget - Verificação da funcionalidade do aplicativo
///
/// Este arquivo contém os testes automatizados que verificam se:
/// - O aplicativo inicia corretamente
/// - As telas são exibidas conforme esperado
/// - Os componentes funcionam adequadamente
void main() {
  testWidgets('App starts with splash screen', (WidgetTester tester) async {
    // Constrói o aplicativo e dispara um frame de renderização
    await tester.pumpWidget(NubankApp());

    // Verifica se a tela de splash é exibida corretamente
    // Procura pelo indicador de carregamento circular
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // Processa todos os timers pendentes para evitar avisos de timer
    // Isso é necessário porque o SplashScreen tem um timer de navegação automática
    await tester.pumpAndSettle();
  });
}
