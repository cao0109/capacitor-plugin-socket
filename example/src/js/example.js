import { Tcp } from 'capacitor-plugin-socket';

window.testEcho = () => {
    const inputValue = document.getElementById("echoInput").value;
    Tcp.echo({ value: inputValue })
}
