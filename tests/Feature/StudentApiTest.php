<?php

namespace Tests\Feature;

use App\Models\Student;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class StudentApiTest extends TestCase
{
    use RefreshDatabase;

    public function test_students_index_route_is_public(): void
    {
        Student::create([
            'student_id' => 'S001',
            'name' => 'Alice',
            'major' => 'Computer Science',
        ]);

        $response = $this->getJson('/api/students');

        $response->assertOk()
            ->assertJsonFragment([
                'student_id' => 'S001',
                'name' => 'Alice',
                'major' => 'Computer Science',
            ]);
    }
}
