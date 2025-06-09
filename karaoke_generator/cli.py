import typer
from karaoke_generator.main import process  # assume existing main pipeline

app = typer.Typer(help="Generate karaoke videos from a URL or local file")


@app.command()
def run(
    source: str = typer.Argument(..., help="YouTube URL or path to audio/video file"),
    out_dir: str = typer.Option("output", help="Directory for finished video"),
):
    """End-to-end pipeline: download/separate/transcribe/render."""
    process(source, out_dir)


if __name__ == "__main__":
    app()
