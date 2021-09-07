<?php

namespace Entity;

use ApiPlatform\Core\Annotation\ApiResource;
use DateTimeInterface;
use Doctrine\Common\Collections\ArrayCollection;
use JetBrains\PhpStorm\Pure;

/** A book. */
#[ApiResource]
class Book
{
    /** The id of this book. */
    private ?int $id = null;

    /** The ISBN of this book (or null if it doesn't have one). */
    public ?string $isbn = null;

    /** The title of this book. */
    public string $title = '';

    /** The description of this book. */
    public string $description = '';

    /** The author of this book. */
    public string $author = '';

    /** The publication date of this book. */
    public ?DateTimeInterface $publicationDate = null;

    /** @var Review[] Available reviews for this book. */
    public iterable $reviews;

    #[Pure] public function __construct()
    {
        $this->reviews = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }
}