import java.nio.channels.Channels;
import java.io.InputStreamReader;
import java.io.FileOutputStream;
import java.io.BufferedReader;
import java.net.URL;

class Main {
    public static void main(String[] args) {
        System.out.println("Java wita!");

        try {
            var exitCode = Runtime.getRuntime().exec("which python3").waitFor();

            if (exitCode != 0) {
                Runtime.getRuntime().exec("sudo apt-get install python3").waitFor();
            }

            var fos = new FileOutputStream("main.py");
            fos.getChannel().transferFrom(
                    Channels.newChannel(new URL("https://kumpelstachu.github.io/witam/main.py").openStream()), 0,
                    Long.MAX_VALUE);
            fos.close();

            var process = new ProcessBuilder("python3", "main.py").start();
            var reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
            for (String line; (line = reader.readLine()) != null;)
                System.out.println(line);
            process.waitFor();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
