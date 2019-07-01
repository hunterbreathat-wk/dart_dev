import 'package:args/command_runner.dart';
import 'package:dart_dev/commands/analyze_command.dart';
import 'package:dart_dev/commands/format_command.dart';
import 'package:dart_dev/commands/test_command.dart';
import 'package:dart_dev/commands/webdev_serve_command.dart';

Iterable<Command<int>> build({
  AnalyzeConfig analyzeConfig,
  FormatConfig formatConfig,
  WebdevServeConfig serveConfig,
  TestConfig testConfig,
}) =>
    [
      // command: analyze
      AnalyzeCommand(
        AnalyzeConfig(
          commandName: 'analyze',
        ).merge(analyzeConfig),
      ),

      // command: format
      FormatCommand(
        FormatConfig(
          commandName: 'format',

          // Write formatting changes to disk by default. In other words, the user
          // doesn't need to explicitly pass the `-w | --overwrite` flag.
          defaultMode: FormatMode.overwrite,
        ).merge(formatConfig),
      ),

      WebdevServeCommand(
        WebdevServeConfig(
          commandName: 'serve',
        ).merge(serveConfig),
      ),

      // command: test
      TestCommand(
        TestConfig().merge(testConfig),
      ),
    ];
