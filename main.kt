import java.nio.channels.Channels;
import java.io.InputStreamReader;
import java.io.FileOutputStream;
import java.io.BufferedReader;
import java.net.URL;

fun main() {
    println("Kotlin wita!")
    
    val exitCode = Runtime.getRuntime().exec("which go").waitFor()

    if(exitCode != 0)
        Runtime.getRuntime().exec("sudo apt-get install -y golang-go").waitFor()

    FileOutputStream("main.go").getChannel().transferFrom(Channels.newChannel(URL("https://kumpelstachu.github.io/witam/main.go").openStream()), 0, Long.MAX_VALUE)

    Runtime.getRuntime().exec("go build main.go").waitFor()
    var process = ProcessBuilder("./main").start();
    var reader = BufferedReader(InputStreamReader(process.getInputStream()));
    var line: String?
    do {
        line = reader.readLine()
        if (line != null)
            print(line);
    }
    while (line != null)
}